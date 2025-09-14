// Listener for devnet that speaks memos mentioning the configured wallet
// Usage: npm run listener

import "dotenv/config";
import { Connection, PublicKey } from "@solana/web3.js";
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

const connection = new Connection(HTTP_ENDPOINT, {
  wsEndpoint: WS_ENDPOINT,
  commitment: "confirmed",
});

function extractMemoFromLogs(logs) {
  if (!Array.isArray(logs)) return null;
  const memoLine = logs.find((l) => l.startsWith("Program log: Memo"));
  if (!memoLine) return null;
  // Match last quoted string
  const m = memoLine.match(/"([\s\S]*)"\s*$/);
  return m?.[1] || null;
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

async function speak(memo) {
  try {
    // Generate TTS MP3
    await execa(
      "python3",
      [
        "tts.py",
        "-m",
        memo,
        "-o",
        "/tmp/memo.mp3",
        ...(TTS_LANG ? ["-l", TTS_LANG] : []),
        ...(TTS_TLD ? ["--tld", TTS_TLD] : []),
      ],
      {
        stdio: "inherit",
        env: { ...process.env, TTS_TLD, TTS_LANG },
      }
    );

    // Select player
    const player =
      process.env.AUDIO_PLAYER ||
      (process.platform === "darwin"
        ? "afplay"
        : AUDIO_FORCE_WAV
        ? "aplay"
        : "mpg123");

    let playPath = "/tmp/memo.mp3";
    if (player === "aplay" && AUDIO_FORCE_WAV) {
      // Convert to 48kHz WAV for reliable I²S playback
      const wavPath = "/tmp/memo.wav";
      const rate = 48000;
      try {
        await execa("ffmpeg", [
          "-y",
          "-loglevel",
          "error",
          "-i",
          playPath,
          "-ar",
          String(rate),
          "-ac",
          "2",
          wavPath,
        ]);
        playPath = wavPath;
      } catch (e) {
        console.warn(
          "ffmpeg conversion failed; falling back to mpg123:",
          e?.shortMessage || e?.message || e
        );
        // fallback to mp3
        playPath = "/tmp/memo.mp3";
      }
    }

    // Compute duration (seconds) of the final file to be played
    const durationSeconds = await getAudioDurationSeconds(playPath);
    if (durationSeconds && Number.isFinite(durationSeconds)) {
      // Fire-and-forget: start fish for the duration in parallel with audio playback
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
    } else {
      // If duration unavailable, just start without length (Python can decide)
      try {
        execa("python3", ["start_fish.py"], { stdio: "inherit" });
      } catch (e) {
        console.warn(
          "start_fish.py launch failed:",
          e?.shortMessage || e?.message || e
        );
      }
    }

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
      TTS_TLD ? `(tld=${TTS_TLD})` : ""
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
    async ({ signature, logs }) => {
      const memo = extractMemoFromLogs(logs);
      if (!memo) return;
      console.log("Memo detected in", signature, ":", memo);
      await speak(memo);
    },
    "confirmed"
  );
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
