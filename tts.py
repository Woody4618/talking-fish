#!/usr/bin/env python3

import argparse
import os
import sys
from typing import Optional


def save_text_to_mp3(text: str, output_path: str, language_code: str = "en", use_slow_speed: bool = False, tld: Optional[str] = None) -> str:
	"""Convert text to speech and save as an MP3 file.

	Args:
		text: The message to synthesize.
		output_path: Desired output path. ".mp3" will be appended if missing.
		language_code: gTTS language code (e.g., "en", "es", "fr").
		use_slow_speed: If True, use a slower speech rate.
		tld: Optional top-level domain used by gTTS (e.g., "co.uk", "com.au") to vary accent.

	Returns:
		The absolute output path where the MP3 was written.
	"""
	if not isinstance(text, str):
		raise TypeError("text must be a string")

	clean_text = text.strip()
	if not clean_text:
		raise ValueError("Provided text is empty after trimming")

	resolved_output = os.path.expanduser(output_path)
	if not resolved_output.lower().endswith(".mp3"):
		resolved_output += ".mp3"

	output_dir = os.path.dirname(resolved_output) or "."
	os.makedirs(output_dir, exist_ok=True)

	# Lazy import so the module is only needed when actually used
	from gtts import gTTS

	kwargs = {"text": clean_text, "lang": language_code, "slow": use_slow_speed}
	if tld:
		kwargs["tld"] = tld
	tts = gTTS(**kwargs)
	tts.save(resolved_output)

	return os.path.abspath(resolved_output)


def _read_text_from_file(path: str) -> str:
	with open(path, "r", encoding="utf-8") as f:
		return f.read()


def _read_text_from_stdin() -> str:
	return sys.stdin.read()


def main(argv: Optional[list[str]] = None) -> int:
	parser = argparse.ArgumentParser(description="Convert text to MP3 using gTTS.")
	group = parser.add_mutually_exclusive_group()
	group.add_argument("-m", "--text", type=str, help="Text to convert to speech")
	group.add_argument("-f", "--file", type=str, help="Path to a UTF-8 text file")
	parser.add_argument("-o", "--output", type=str, default="output.mp3", help="Output MP3 file path (default: output.mp3)")
	parser.add_argument("-l", "--lang", type=str, default="en", help="Language code (default: en)")
	parser.add_argument("--slow", action="store_true", help="Speak slowly")
	parser.add_argument("--tld", type=str, default=os.environ.get("TTS_TLD", ""), help="Accent via TLD (e.g., co.uk, com.au). Also reads TTS_TLD env var.")

	args = parser.parse_args(argv)

	# Determine source of text
	text: Optional[str] = None
	if args.text is not None:
		text = args.text
	elif args.file is not None:
		try:
			text = _read_text_from_file(args.file)
		except FileNotFoundError:
			print(f"Error: file not found: {args.file}", file=sys.stderr)
			return 2
		except OSError as e:
			print(f"Error reading file '{args.file}': {e}", file=sys.stderr)
			return 2
	else:
		# If nothing provided, try stdin when piped
		if not sys.stdin.isatty():
			text = _read_text_from_stdin()
		else:
			parser.error("Provide -m/--text, -f/--file, or pipe text via stdin")
			return 2

	if text is None or not text.strip():
		print("Error: no text provided after trimming", file=sys.stderr)
		return 2

	try:
		written_path = save_text_to_mp3(
			text=text,
			output_path=args.output,
			language_code=args.lang,
			use_slow_speed=args.slow,
			tld=(args.tld or None),
		)
		print(f"Wrote MP3 to {written_path}")
		return 0
	except Exception as e:
		print(f"Failed to synthesize speech: {e}", file=sys.stderr)
		return 1


if __name__ == "__main__":
	sys.exit(main()) 