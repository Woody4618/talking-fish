// Send a SOL transfer with a memo for testing using the default Solana keypair
// Usage:
// DEST=<recipient_pubkey> MEMO="Hello fish" node scripts/send_memo.js
// Or: npm run send:memo
// Sends via the v4 memo program; set MEMO_PROGRAM to use an older version.

import fs from "fs";
import os from "os";
import path from "path";
import {
  Connection,
  Keypair,
  LAMPORTS_PER_SOL,
  PublicKey,
  SystemProgram,
  Transaction,
  TransactionInstruction,
} from "@solana/web3.js";
import { MEMO_PROGRAM_ADDRESS } from "@solana-program/memo";

const DEST = process.env.DEST || "GsfNSuZFrT2r4xzSndnCSs9tTXwt47etPqU8yFVnDcXd";
const MEMO = process.env.MEMO || "Hello from talking Memo the solana reading fish ";
const HTTP_ENDPOINT =
  process.env.SOLANA_HTTP || "https://api.devnet.solana.com";
// Defaults to the current (v4) memo program; the listener reads every version
const MEMO_PROGRAM = process.env.MEMO_PROGRAM || MEMO_PROGRAM_ADDRESS;

function loadKeypairFromFile(filePath) {
  const secret = JSON.parse(fs.readFileSync(filePath, "utf8"));
  const secretKey = Uint8Array.from(secret);
  return Keypair.fromSecretKey(secretKey);
}

function loadDefaultKeypair() {
  const kpPath =
    process.env.SOLANA_KEYPAIR ||
    path.join(os.homedir(), ".config", "solana", "id.json");
  if (!fs.existsSync(kpPath)) {
    throw new Error(
      `Keypair file not found at ${kpPath}. Set SOLANA_KEYPAIR to override.`
    );
  }
  return loadKeypairFromFile(kpPath);
}

async function ensureAirdropIfDevnet(conn, pubkey) {
  const isDevnet = /devnet/.test(HTTP_ENDPOINT);
  if (!isDevnet) return;
  const bal = await conn.getBalance(pubkey);
  if (bal >= 0.02 * LAMPORTS_PER_SOL) return;
  console.log("Requesting airdrop (devnet)...");
  const sig = await conn.requestAirdrop(pubkey, 1 * LAMPORTS_PER_SOL);
  await conn.confirmTransaction(sig, "confirmed");
  console.log("Airdrop confirmed");
}

async function main() {
  const connection = new Connection(HTTP_ENDPOINT, "confirmed");
  const payer = loadDefaultKeypair();
  console.log("Using payer:", payer.publicKey.toBase58());
  console.log("Memo program:", MEMO_PROGRAM);
  await ensureAirdropIfDevnet(connection, payer.publicKey);

  const ixTransfer = SystemProgram.transfer({
    fromPubkey: payer.publicKey,
    toPubkey: new PublicKey(DEST),
    lamports: 10_000, // 0.00001 SOL
  });

  const memoProgramId = new PublicKey(MEMO_PROGRAM);
  const ixMemo = new TransactionInstruction({
    keys: [{ pubkey: payer.publicKey, isSigner: true, isWritable: false }],
    programId: memoProgramId,
    data: Buffer.from(MEMO, "utf8"),
  });

  const tx = new Transaction().add(ixTransfer, ixMemo);
  const sig = await connection.sendTransaction(tx, [payer]);
  await connection.confirmTransaction(sig, "confirmed");
  console.log("Sent tx:", sig);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
