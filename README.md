<p align="center">
  <img src="Logo.png" alt="Emu-Dock Logo" width="200">
</p>

# 🚀 EmuDock

Emulate x86 Linux on Apple Silicon Macs using Docker — with GUI support



## 📌 Overview

EmuDock is a helper project designed to simplify running x86 (amd64) Linux environments on ARM-based Apple Silicon Macs (M1 / M2 / M3) using Docker.

It leverages Docker’s multi-architecture capabilities (QEMU emulation under the hood) and adds GUI application support via XQuartz, allowing you to run both CLI and graphical Linux applications seamlessly on macOS.



## 🎯 Project Goals

		✅ Run legacy or x86-only Linux software on ARM Macs
		✅ Avoid heavy virtual machines
		✅ Provide GUI (X11) application support
		✅ Keep setup simple and script-driven


## ✨ Features
	•	🖥 x86_64 (amd64) Linux emulation on Apple Silicon (ARM)
	•	🐳 Docker-based containers
	•	🔁 Automatic QEMU CPU emulation
	•	🎨 GUI application support using X11 + XQuartz
	•	⚙️ Simple script-based workflow
	•	🧪 Ideal for testing, development, and legacy apps



## 🧠 How It Works
	1.	Docker runs an amd64 Linux image on an ARM host
	2.	Docker uses QEMU for cross-architecture emulation
	3.	Linux applications send X11 output
	4.	XQuartz displays Linux GUI apps as macOS windows



📦 Requirements

Hardware
	•	Apple Silicon Mac (M1 / M2 / M3) arm structure

Software
	•	macOS
	•	Docker Desktop for Mac
	•	XQuartz



## 🔧 Installation

1️⃣ Install Docker Desktop

Download and install Docker Desktop:
	•	https://www.docker.com/products/docker-desktop/

Verify installation:

docker --version




2️⃣ Install XQuartz

Download XQuartz from:
	•	https://www.xquartz.org/

After installation:
	1.	Log out and log back in
	2.	Open XQuartz → Settings → Security
	3.	Enable “Allow connections from network clients”



▶️ Usage (Manual Example)

EmuDock will provide a script to automate this process.

Allow X11 Connections

xhost +localhost

Run an x86 Linux Container

docker run --platform linux/amd64 \
  -e DISPLAY=host.docker.internal:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --name emudock \
  -it ubuntu:22.04 bash




🧪 Test GUI Applications

Inside the container:

apt update
apt install -y x11-apps
xeyes

You should see a graphical window appear on macOS 🎉






⚠️ Limitations
	•	⏳ Emulation is slower than native ARM containers
	•	🎮 Not suitable for GPU-heavy workloads
	•	🪟 GUI performance depends on X11 forwarding



🤝 Contributing

Contributions are welcome!
	1.	Fork the repository
	2.	Create a new branch
	3.	Commit your changes
	4.	Open a Pull Request


