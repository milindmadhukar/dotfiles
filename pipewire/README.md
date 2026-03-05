# PipeWire Configuration for Audiocular Spark DAC

This configuration provides automatic switching between the Audiocular Spark DAC (32-bit/384kHz) and built-in audio.

## What's Included

- `pipewire.conf.d/audiocular-spark-hires.conf.template` - High-resolution DAC configuration template
  - Creates a dedicated 384kHz audio sink when DAC is connected
  - Configures optimal buffer sizes (512 samples)
  - Uses hardware device path `hw:Spark` for automatic detection

- `pipewire-pulse.conf.d/audiocular-spark-hires.conf` - PulseAudio compatibility layer configuration
  - Forces high sample rate for PulseAudio applications
  - Sets maximum resampling quality (10)

## Installation

From the dotfiles directory:

```bash
stow pipewire
stow scripts  # For the switch-audio command
```

## Usage

### Automatic Switching

Run `switch-audio` to automatically:
- Detect if Audiocular Spark DAC is connected
- Enable/disable the high-res config as needed
- Restart PipeWire if config changes
- Set the appropriate device as default

```bash
# When you plug in or unplug the DAC, run:
switch-audio
```

### Manual Device Selection

Use `wpctl` to manually select audio output:

```bash
# List all audio devices
wpctl status

# Set Audiocular Spark 384kHz as default (when connected)
wpctl set-default <ID>

# Set built-in speakers as default
wpctl set-default <ID>
```

## How It Works

1. The `.conf.template` file contains the DAC configuration but is NOT loaded by PipeWire
2. When you run `switch-audio`:
   - If DAC is connected: copies template to `.conf` and restarts PipeWire
   - If DAC is disconnected: removes `.conf` and restarts PipeWire
3. This prevents PipeWire from crashing when the DAC is not present

## Verification

Check current audio setup:

```bash
# Show all audio devices and default
wpctl status

# Check PipeWire sample rate (when DAC is active)
pw-metadata -n settings | grep clock.rate

# Verify DAC is detected
cat /proc/asound/cards | grep Spark
```

## Hardware Specifications

- **DAC:** Audiocular Spark (TTGK Technology Co., Ltd)
- **USB ID:** 3302:33a7
- **Card Name:** "Spark" (usually appears as card 4)
- **Maximum Resolution:** 32-bit/384kHz
- **Format:** S32_LE (signed 32-bit little-endian)
- **Channels:** 2 (Stereo)

## Troubleshooting

If PipeWire fails to start, check the logs:

```bash
journalctl --user -u pipewire -n 50
```

If the DAC isn't working after connecting, run:

```bash
switch-audio
```
