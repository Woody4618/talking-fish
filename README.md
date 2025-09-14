# Talking Fish - Solana Memo to Fish voice

A Big Mouth Belly Bass Fish that listens to memos on the solana blockchain and speaks them out loud.
Will be great for workshops. First person that manages to send a memo to the fish wins a prize.
Or for live streams, where people can ask questions and the fish will blare them in from behind. :D

<img width="719" height="394" alt="fish" src="https://github.com/user-attachments/assets/ef77667b-27d4-4d66-aa2d-a9decc980cad" />

Video of the Fish in action: 

https://x.com/SolPlay_jonas/status/1966846254207426760

Quickstart (macOS)

```bash
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
npm install
npm run listener
npm run send:memo
```

You can also use the web app to send memos:

```bash
cd anchorCounter/counter
npm run dev
http://localhost:3000/memo
```

You can deploy it to vercel for example.
Note: gTTS uses an online service. An internet connection is required.

## Install

```bash
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
```

or

```bash
python3 -m pip install --user -r requirements.txt
```

## Install on Raspberry Pi

### MAX98357A

On the raspberry pi, you need to run the following:

Copy files to raspberry pi:

Pick a way of choise to copy the files to the raspberry pi.

I used rsync but you can also use scp or just copy the files manually.

```bash
rsync -azP --delete \
  --exclude '.git' \
  --exclude '.venv' \
  --exclude '**/node_modules' \
  --exclude '**/.next' \
  --exclude '**/target' \
  --exclude '**/dist' \
  /Users/jonasmac2/Documents/GitHub/talking-fish/ \
  pi@raspberrypi.local:Documents/talking-fish/
```

Replace pi@raspberrypi.local with your raspberry pi ip address or network name.

```bash
sudo apt update
sudo apt install npm
sudo apt install nodejs
sudo python3 -m pip install --break-system-packages -r ~/requirements.txt
```

Wiring the Raspberry Pi’s I²S audio to a MAX98357A class‑D amplifier.

- Power

  - VIN → 5V on Pi (physical pin 2 or 4)
  - GND → GND on Pi (physical pin 6, 9, 14, etc.)

- I²S signals

  - DIN (Data In) → GPIO21 / physical pin 40 (PCM_DOUT)
  - BCLK (Bit Clock) → GPIO18 / physical pin 12 (PCM_CLK)
  - LRCLK (Word Select / LRC) → GPIO19 / physical pin 35 (PCM_FS)

- Speaker
  - Connect directly to the + and − screw terminals on the MAX98357A
  - Do not tie either speaker terminal to ground (class‑D output)
  - Use a 3W 3–8 Ω speaker

Enable I2S on the raspberry pi:

```bash
sudo raspi-config
```

Navigate the interfaces and enable I2S. Then reboot.

```bash
sudo nano /boot/firmware/config.txt
```

Add the following line to the file:

```bash
dtoverlay=hifiberry-dac
```

Then reboot.

```bash
sudo reboot
```

Then you should be able to see the "snd_rpi_hifiberry_dac" using `aplay -l`.

Then you can test the audio output:

```bash
sudo apt install mpg123
mpg123 hello.mp3
```

### WM9860 (optional)

If you want to have a better sound quality, you can use the WM9860.

The setup is pretty much the same just for the audio driver put:

```bash
dtparam=i2s=on
dtoverlay=iqaudio-dacplus
```

Then reboot.

```bash
sudo reboot
```

## Modding the fish

What i did, was i unsoldered the speaker of the fish and soldered a connection from the
MAX98357A to the speaker of the fish. Its also a 3W and 5Ohm speaker i think so it works.
Then i unsoldered the the button cables and attached it to a relay that is controlled via the GPIO 17 pin of the raspberry pi.
My fish does not have seperate motors for mouth and tail movement sadly but instead two different fixed sequences. So what i did it i just press the button via the relay and then measure the mp3 length and press the button again when the text is over to stop the movement.
If your Fish has a seperate mouth motor you can actually sync the movement with the audio, which would be cool.

## Manual Usage

- Convert a message directly:

```bash
python tts.py -m "Hello from Talking Fish" -o hello.mp3
```

- Read from a text file:

```bash
python tts.py -f message.txt -o output.mp3
```

## Options

- `-m, --text` Text to convert to speech
- `-f, --file` Path to a UTF-8 text file
- `-o, --output` Output MP3 path (default: `output.mp3`)
- `-l, --lang` Language code (default: `en`)

Language codes can be found in the [gTTS documentation](https://gtts.readthedocs.io/en/latest/module.html#languages-gtts-lang).

## Examples

```bash
python tts.py -m "Bonjour tout le monde" -l fr -o bonjour.mp3
```

## Troubleshooting

- If you sound is very slow and sluggish you may need to disable piggpio on the raspberry pi.
- If you see network-related errors, ensure you have an active internet connection.
- If you get permission errors writing the output, choose a writable directory or run from a directory you own.

- Env vars:

  - `HTTPS_RPC_URL` (default: `https://api.devnet.solana.com`)
  - `WSS_RPC_URL` (default: `wss://api.devnet.solana.com/`)
  - `TTS_TLD` optional gTTS accent via TLD (e.g., `co.uk`, `com.au`, `ie`, `co.za`)

Optional/debug:

- `AUDIO_PLAYER` choose player (`mpg123`/`aplay`/`afplay`), or `echo` for console-only
- `AUDIO_DEVICE` ALSA device (e.g., `plughw:0,0`)
- `AUDIO_RATE` playback rate for `mpg123` (e.g., `48000`)
- `AUDIO_FORCE_WAV=1` convert MP3→WAV at 48k (ffmpeg) and play via `aplay`

- Duration sync:

  - Requires `ffmpeg`/`ffprobe` on the Pi (`sudo apt install -y ffmpeg`).
  - The listener computes the audio duration and starts `start_fish.py --seconds <duration>` so the fish runs exactly as long as the memo audio.

- Raspberry Pi audio tips:
  - Prefer `AUDIO_FORCE_WAV=1` and `AUDIO_DEVICE=plughw:0,0` for I²S DACs (hifiberry/iqaudio).
  - Set `AUDIO_RATE=48000` when using `mpg123` (if not forcing WAV).
  - Adjust mixer: `alsamixer` → select your I²S card and raise Digital/PCM.

## Send a test memo (devnet)

```bash
# Option 1: default DEST+MEMO
npm run send:memo

# Option 2: custom
DEST=GsfNSuZFrT2r4xzSndnCSs9tTXwt47etPqU8yFVnDcXd MEMO="Hello from devnet" npm run send:memo
```

This script uses the default solana keypair. So you should have Solana CLI tools installed. It airdrops 1 SOL to a temporary keypair (devnet) if you don't have any SOL, then sends 0.00001 SOL to `DEST` with a memo.

## Notes on TTS cost

- gTTS uses Google Translate’s TTS endpoint and is commonly used without explicit billing for light usage; it’s not an official paid Cloud TTS API. For reliability and higher volume, consider Google Cloud Text-to-Speech, AWS Polly, or Azure TTS (paid). For now, small/occasional memos typically work fine for free.
