// Listener for devnet that speaks memos mentioning the configured wallet
// Usage: npm run listener

import "dotenv/config";
import { Connection, PublicKey } from "@solana/web3.js";
import { getMemosFromInstructions } from "@solana-program/memo";
import { getBase58Encoder } from "@solana/kit";
import { execa } from "execa";

const WALLET =
  process.env.FISH_WALLET || "GsfNSuZFrT2r4xzSndnCSs9tTXwt47etPqU8yFVnDcXd";
const HTTP_ENDPOINT =
  process.env.HTTPS_RPC_URL || "https://api.devnet.solana.com";
const WS_ENDPOINT = process.env.WSS_RPC_URL || "wss://api.devnet.solana.com/";
const TTS_TLD = process.env.TTS_TLD || ""; // e.g., "co.uk", "com.au", "ie"
const TTS_LANG = process.env.TTS_LANG || ""; // e.g., "en", "fr", "de"

// Audio options
const AUDIO_DEVICE = process.env.AUDIO_DEVICE || ""; // ALSA device, e.g., plughw:0,0
const AUDIO_RATE = Number(process.env.AUDIO_RATE || 48000); // e.g., 48000
const AUDIO_FORCE_WAV = process.env.AUDIO_FORCE_WAV === "1"; // convert mp3->wav 48k via ffmpeg and play with aplay

// Duration options
const PROBE_TIMEOUT_MS = Number(process.env.PROBE_TIMEOUT_MS || 1500);

// Transaction fetch retries (logs can arrive before the tx is queryable)
const TX_FETCH_ATTEMPTS = Number(process.env.TX_FETCH_ATTEMPTS || 3);
const TX_FETCH_DELAY_MS = Number(process.env.TX_FETCH_DELAY_MS || 400);

const connection = new Connection(HTTP_ENDPOINT, {
  wsEndpoint: WS_ENDPOINT,
  commitment: "confirmed",
});

const base58Encoder = getBase58Encoder();

// Shape a web3.js transaction into the { programAddress, data } instructions the
// memo client expects. The v4 memo program no longer logs the memo, so it has to
// be read from instruction data instead of from the log messages.
function toInstructions(tx) {
  const message = tx.transaction.message;
  const accountKeys = message.getAccountKeys({
    accountKeysFromLookups: tx.meta?.loadedAddresses,
  });
  const compiled = [
    ...message.compiledInstructions,
    // Memos sent through a CPI only appear as inner instructions
    ...(tx.meta?.innerInstructions ?? []).flatMap((i) => i.instructions),
  ];

  return compiled.flatMap((ix) => {
    const programId = accountKeys.get(ix.programIdIndex);
    if (!programId) return [];
    return [
      {
        programAddress: programId.toBase58(),
        // Inner instructions come back base58 encoded, top level ones as bytes
        data:
          typeof ix.data === "string"
            ? base58Encoder.encode(ix.data)
            : ix.data,
      },
    ];
  });
}

async function extractMemos(signature) {
  // The transaction is not always queryable the instant the logs arrive
  for (let attempt = 0; attempt < TX_FETCH_ATTEMPTS; attempt++) {
    const tx = await connection.getTransaction(signature, {
      commitment: "confirmed",
      maxSupportedTransactionVersion: 0,
    });
    if (tx) {
      return getMemosFromInstructions(toInstructions(tx))
        .map((m) => m.memo)
        .filter((memo) => memo.trim());
    }
    await new Promise((resolve) => setTimeout(resolve, TX_FETCH_DELAY_MS));
  }
  console.warn("Could not fetch transaction", signature);
  return [];
}

async function getAudioDurationSeconds(filePath) {
  try {
    const { stdout } = await execa("ffprobe", [
      "-v",
      "error",
      "-show_entries",
      "format=duration",
      "-of",
      "default=noprint_wrappers=1:nokey=1",
      filePath,
    ]);
    const seconds = parseFloat(stdout.trim());
    return Number.isFinite(seconds) ? seconds : null;
  } catch {
    return null;
  }
}

function estimateDurationSeconds(text) {
  // Rough estimate: ~150 wpm => ~2.5 words/sec. Add small buffer.
  const words = (text || "").trim().split(/\s+/).filter(Boolean).length;
  const sec = words / 2.5 + 0.5;
  return Math.max(1, Math.min(120, sec));
}

async function speak(memo) {
  try {
    const mp3Path = "/tmp/memo.mp3";

    // Generate TTS MP3
    await execa(
      "python3",
      [
        "tts.py",
        "-m",
        memo,
        "-o",
        mp3Path,
        ...(TTS_LANG ? ["-l", TTS_LANG] : []),
        ...(TTS_TLD ? ["--tld", TTS_TLD] : []),
      ],
      {
        stdio: "inherit",
        env: { ...process.env, TTS_TLD, TTS_LANG },
      }
    );

    // Start duration probing on MP3 immediately and race with a timeout and estimate
    const probePromise = getAudioDurationSeconds(mp3Path);
    const timeoutPromise = new Promise((resolve) =>
      setTimeout(() => resolve(null), PROBE_TIMEOUT_MS)
    );
    const probedSeconds = await Promise.race([probePromise, timeoutPromise]);
    const durationSeconds =
      probedSeconds && Number.isFinite(probedSeconds)
        ? probedSeconds
        : estimateDurationSeconds(memo);

    // Kick off WAV conversion in parallel if needed
    const player =
      process.env.AUDIO_PLAYER ||
      (process.platform === "darwin"
        ? "afplay"
        : AUDIO_FORCE_WAV
        ? "aplay"
        : "mpg123");

    let playPath = mp3Path;
    let convertPromise = Promise.resolve();
    if (player === "aplay" && AUDIO_FORCE_WAV) {
      const wavPath = "/tmp/memo.wav";
      const rate = 48000;
      convertPromise = execa("ffmpeg", [
        "-y",
        "-loglevel",
        "error",
        "-i",
        mp3Path,
        "-ar",
        String(rate),
        "-ac",
        "2",
        wavPath,
      ])
        .then(() => {
          playPath = wavPath;
        })
        .catch((e) => {
          console.warn(
            "ffmpeg conversion failed; falling back to mpg123:",
            e?.shortMessage || e?.message || e
          );
          playPath = mp3Path;
        });
    }

    // Fire-and-forget: start fish for the duration in parallel with audio preparation
    try {
      execa(
        "python3",
        ["start_fish.py", "--seconds", String(Math.ceil(durationSeconds))],
        { stdio: "inherit" }
      );
    } catch (e) {
      console.warn(
        "start_fish.py launch failed:",
        e?.shortMessage || e?.message || e
      );
    }

    // Wait for conversion if any, then play
    await convertPromise;

    let args = [];
    if (player === "mpg123") {
      args = ["-q"];
      if (AUDIO_RATE) args.push("-r", String(AUDIO_RATE));
      if (AUDIO_DEVICE) args.push("-a", AUDIO_DEVICE);
      args.push(playPath);
    } else if (player === "aplay") {
      args = ["-q"];
      if (AUDIO_DEVICE) args.push("-D", AUDIO_DEVICE);
      args.push(playPath);
    } else {
      // afplay on macOS
      args = [playPath];
    }

    console.log(
      "Audio player:",
      player,
      AUDIO_DEVICE ? `(device=${AUDIO_DEVICE})` : "",
      TTS_LANG ? `(lang=${TTS_LANG})` : "",
      TTS_TLD ? `(tld=${TTS_TLD})` : "",
      `(duration≈${Math.ceil(durationSeconds)}s)`
    );
    await execa(player, args);
  } catch (e) {
    console.error("Audio error:", e);
  }
}

async function main() {
  const walletPk = new PublicKey(WALLET);
  console.log("HTTP_ENDPOINT =", HTTP_ENDPOINT);
  console.log("WS_ENDPOINT   =", WS_ENDPOINT);
  if (TTS_TLD) console.log("TTS accent (tld) =", TTS_TLD);
  if (TTS_LANG) console.log("TTS language (lang) =", TTS_LANG);
  if (AUDIO_DEVICE) console.log("AUDIO_DEVICE =", AUDIO_DEVICE);
  if (AUDIO_RATE) console.log("AUDIO_RATE =", AUDIO_RATE);
  if (AUDIO_FORCE_WAV)
    console.log("AUDIO_FORCE_WAV = on (ffmpeg -> aplay path)");
  console.log("Listening for memos mentioning", walletPk.toBase58());

  connection.onLogs(
    walletPk,
    async ({ signature, err }) => {
      if (err) return;
      const memos = await extractMemos(signature);
      for (const memo of memos) {
        console.log("Memo detected in", signature, ":", memo);
        await speak(memo);
      }
    },
    "confirmed"
  );
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
