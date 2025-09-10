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

async function speak(memo) {
  try {
    await execa("python3", ["tts.py", "-m", memo, "-o", "/tmp/memo.mp3"], {
      stdio: "inherit",
    });
    await execa("afplay", ["/tmp/memo.mp3"]);
  } catch (e) {
    console.error("Audio error:", e);
  }
}

async function main() {
  const walletPk = new PublicKey(WALLET);
  console.log("HTTP_ENDPOINT =", HTTP_ENDPOINT);
  console.log("WS_ENDPOINT   =", WS_ENDPOINT);
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
