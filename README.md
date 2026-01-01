<p align="center">
  <img src="https://github.com/lestitaniseur/Emu-dock/blob/main/logo.png?raw=true" alt="EmuDock Logo" width="220">
</p>

<h1 align="center">🚀 EmuDock</h1>

<p align="center">
  <strong>Emulate x86 Linux on Apple Silicon Macs using Docker — with native GUI support.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-macOS%20(Apple%20Silicon)-000000?style=for-the-badge&logo=apple" alt="Platform">
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker">
  <img src="https://img.shields.io/badge/Architecture-x86__64-orange?style=for-the-badge" alt="Architecture">
</p>

---

## 📌 Overview

**EmuDock** is a helper project designed to simplify running x86 (amd64) Linux environments on ARM-based Apple Silicon Macs (M1 / M2 / M3 / M4).
It leverages Docker’s multi-architecture capabilities (via QEMU emulation) and adds seamless GUI support via XQuartz, allowing you to run both CLI and graphical Linux applications without the overhead of a full virtual machine.


## ✨ Features

* **🖥️ x86_64 Emulation:** Run legacy or x86-only Linux software on ARM Macs.
* **🎨 GUI Support:** Full X11 forwarding allows Linux apps to appear as native macOS windows.
* **🐳 Docker-Powered:** Uses the familiar Docker ecosystem for container management.
* **⚙️ Script-Driven:** Simplified workflow to handle complex networking and display flags.
* **🧪 Ideal for Testing:** Perfect for developers needing to test amd64 binaries.

---

## 🧠 How It Works

1.  **Docker** runs an `amd64` Linux image on an ARM host.
2.  **QEMU** handles the cross-architecture translation under the hood.
3.  **X11 Forwarding** sends the application's graphical output to the host.
4.  **XQuartz** renders the GUI directly on your macOS desktop.

---

## 📦 Requirements

### Hardware
* Apple Silicon Mac (M1 / M2 / M3 / M4 series)

### Software
* **macOS**
* **Docker Desktop for Mac** - [Download](https://www.docker.com/products/docker-desktop/)
* **XQuartz** - [Download](https://www.xquartz.org/)

---

## 🔧 Installation & Setup

### 1. Configure XQuartz
1.  Open **XQuartz**.
2.  Navigate to **Settings** (or `Cmd + ,`).
3.  Go to the **Security** tab.
4.  Enable **"Allow connections from network clients"**.
5.  **Restart XQuartz** (Quit and reopen) for changes to take effect.

### 2. Enable Host Access
Run the following command in your macOS terminal to allow Docker to connect to the X11 server:

```bash
xhost +localhost
```

