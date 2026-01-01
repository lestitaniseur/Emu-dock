<p align="center">
  <img src="Logo.png" alt="Emu-Dock Logo" width="200">
</p>

EmuDock

EmuDock is a lightweight helper project that makes it easy to run and emulate x86 Linux environments on Apple Silicon (ARM) Macs using Docker. It is designed for developers who need to test, build, or run legacy x86 Linux applications on modern ARM-based macOS systems.

By combining Docker’s multi-architecture support with QEMU emulation and XQuartz for graphical output, EmuDock provides both CLI and GUI support for x86 Linux containers.

⸻

🚀 Project Goals
	•	Simplify x86 Linux emulation on ARM Macs
	•	Provide an easy-to-use Docker-based workflow
	•	Support graphical Linux applications (GUI) via XQuartz
	•	Minimize manual configuration and setup

⸻

✨ Features
	•	🖥️ x86 (amd64) Linux emulation on ARM (Apple Silicon)
	•	🐳 Docker-based container setup
	•	🔁 Automatic use of QEMU for cross-architecture execution
	•	🎨 GUI application support using X11 and XQuartz
	•	⚙️ Script-driven workflow (simple commands to run)
	•	🧪 Ideal for testing legacy software or cross-platform builds

⸻

🧠 How It Works
	1.	Docker runs an amd64 (x86_64) Linux image on an ARM Mac
	2.	Docker automatically uses QEMU for CPU emulation
	3.	X11 traffic from the container is forwarded to XQuartz on macOS
	4.	GUI Linux apps appear as native windows on macOS

⸻

📦 Requirements
	•	Apple Silicon Mac (M1 / M2 / M3)
	•	macOS
	•	Docker Desktop for Mac￼
	•	XQuartz￼
	•	Internet connection (for pulling images)

⸻

🔧 Installation

1. Install Docker Desktop

Make sure Docker Desktop is installed and running:

docker --version

2. Install XQuartz

Download and install XQuartz:
	•	https://www.xquartz.org/

After installation:
	•	Log out and log back in
	•	Open XQuartz → Settings → Security
	•	Enable: “Allow connections from network clients”

⸻

▶️ Usage (Example Workflow)

test::::::
⸻

📜 Planned Script Features
	•	Automatic detection of Apple Silicon
	•	Automatic XQuartz configuration check
	•	One-command container launch
	•	Volume mounting support
	•	Persistent containers
	•	Optional desktop environments (XFCE, LXDE)


⸻

⚠️ Limitations
	•	Emulation is slower than native ARM containers
	•	Not suitable for heavy graphics or GPU workloads
	•	GUI performance depends on X11 forwarding

⸻

🤝 Contributing

Contributions are welcome!
	1.	Fork the repository
	2.	Create a feature branch
	3.	Commit your changes
	4.	Open a Pull Request

⸻

