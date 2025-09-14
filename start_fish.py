from gpiozero import OutputDevice
from time import sleep
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--seconds', type=float, default=8.0)
args = parser.parse_args()
seconds = args.seconds

relay = OutputDevice(17, active_high=False, initial_value=False)

# press
relay.on()
sleep(0.3)

# release
relay.off()
sleep(seconds + 1)

# press again
relay.on()
sleep(0.3)

# release
relay.off()
