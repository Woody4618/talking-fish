# Talking Fish - Text to MP3

A tiny Python CLI that converts text into an MP3 using Google Text-to-Speech (gTTS).

Note: gTTS uses an online service. An internet connection is required.

## Install

```bash
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
```

## Usage

- Convert a message directly:

```bash
python tts.py -m "Hello from Talking Fish" -o hello.mp3
```

- Read from a text file:

```bash
python tts.py -f message.txt -o output.mp3
```

- Pipe from stdin:

```bash
echo "Hello world" | python tts.py -o output.mp3
```

## Options

- `-m, --text` Text to convert to speech
- `-f, --file` Path to a UTF-8 text file
- `-o, --output` Output MP3 path (default: `output.mp3`)
- `-l, --lang` Language code (default: `en`)
- `--slow` Speak slowly

Common language codes include `en`, `es`, `fr`, `de`, `it`, `ja`, `ko`, `hi`, `ar`, `pt`, `ru`, `zh-CN`.

## Examples

```bash
python tts.py -m "Bonjour tout le monde" -l fr -o bonjour.mp3
```

## Troubleshooting

- If you see network-related errors, ensure you have an active internet connection.
- If you get permission errors writing the output, choose a writable directory or run from a directory you own.

## Node listener (devnet)

Install Node deps:

```bash
npm install
```

Run listener (devnet by default) that speaks memos mentioning your wallet:

```bash
export FISH_WALLET=GsfNSuZFrT2r4xzSndnCSs9tTXwt47etPqU8yFVnDcXd
npm run listener
```

- Env vars:
  - `HTTPS_RPC_URL` (default: `https://api.devnet.solana.com`)
  - `WSS_RPC_URL` (default: `wss://api.devnet.solana.com/`)

macOS playback uses `afplay`. On Linux/RPi use `mpg123` or `aplay` and adjust `scripts/listener.js`.

## Send a test memo (devnet)

```bash
# Option 1: default DEST+MEMO
npm run send:memo

# Option 2: custom
DEST=GsfNSuZFrT2r4xzSndnCSs9tTXwt47etPqU8yFVnDcXd MEMO="Hello from devnet" npm run send:memo
```

This script airdrops 1 SOL to a temporary keypair (devnet), then sends 0.00001 SOL to `DEST` with a memo.

## Notes on TTS cost

- gTTS uses Google Translate’s TTS endpoint and is commonly used without explicit billing for light usage; it’s not an official paid Cloud TTS API. For reliability and higher volume, consider Google Cloud Text-to-Speech, AWS Polly, or Azure TTS (paid). For now, small/occasional memos typically work fine for free.
