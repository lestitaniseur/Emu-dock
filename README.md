![Uploading image.png…]()

# Emu-dock
Automatic x86 (amd64) Linux emulation on Apple Silicon using Docker
x86 on ARM (Apple Silicon) using Docker + QEMU + XQuartz

A GitHub-style project that provides automatic x86 (amd64) Linux emulation on Apple Silicon Macs using Docker, with optional GUI support via XQuartz.

This repository behaves like a scripted environment, not a traditional macOS app.

⸻

What This Project Does
	•	Runs x86_64 Linux containers on ARM Macs
	•	Uses Docker Desktop + QEMU (no manual emulator setup)
	•	One-time setup, then one-command usage
	•	Optional GUI/X11 application support via XQuartz
	•	Reproducible and GitHub-friendly

⸻

Requirements

Hardware
	•	Apple Silicon Mac (M1 / M2 / M3)

Software
	•	Docker Desktop for Mac (Apple Silicon)
	•	Git
	•	(Optional) XQuartz for GUI apps



⸻

One-Time Setup

Clone the repository:

git clone https://github.com/YOUR_USERNAME/x86-on-arm-docker.git
cd x86-on-arm-docker

Enable multi-architecture emulation and build the container:

./scripts/setup.sh

What this does:
	•	Enables QEMU binfmt support
	•	Forces Docker to support linux/amd64
	•	Builds the x86 container

⸻

Running an x86 Linux Shell

Start an interactive x86 container:

./scripts/run.sh

Verify architecture:

uname -m
# Expected output: x86_64


⸻

Optional: GUI / X11 Support (XQuartz)

This project supports running x86 Linux GUI applications using X11 forwarding.

Install XQuartz

Download and install XQuartz for macOS.

After installation:
	1.	Launch XQuartz
	2.	Open XQuartz → Settings → Security
	3.	Enable:
	•	✅ Allow connections from network clients
	4.	Restart XQuartz

Allow local connections:

xhost +localhost


⸻

Running GUI Apps Inside the Container

Start the container with X11 enabled:

DISPLAY=host.docker.internal:0 ./scripts/run.sh

Inside the container, install and run a GUI app:

apt update
apt install -y x11-apps
xclock

If XQuartz is running, the window will appear on macOS.

⸻

How GUI Support Works
	•	XQuartz runs the X11 server on macOS
	•	Docker forwards display output via TCP
	•	QEMU emulates x86 instructions
	•	GUI apps behave like native Linux X11 apps

⸻

Common Issues

Slow Performance
	•	x86 emulation is slower than native ARM
	•	Prefer CLI tools when possible

GUI Not Appearing
	•	Ensure XQuartz is running
	•	Re-run xhost +localhost
	•	Verify DISPLAY is set correctly

Docker Build Fails
	•	Make sure Docker Desktop is running
	•	Re-run setup:

./scripts/setup.sh



⸻

Intended Use Cases
	•	Running legacy x86-only Linux tools
	•	Testing x86 binaries on Apple Silicon
	•	Cross-architecture development
	•	CI parity with x86 environments



