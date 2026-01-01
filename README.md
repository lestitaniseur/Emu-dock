<p align="center">
  <img src="https://github.com/lestitaniseur/Emu-dock/blob/main/logo.png?raw=true" alt="EmuDock Logo" width="200" style="border-radius: 20%;">
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

**EmuDock** is a helper tool designed to simplify running x86 (amd64) Linux environments on ARM-based Apple Silicon Macs (M1 / M2 / M3 / M4). 

It leverages Docker’s multi-architecture capabilities (via QEMU emulation) and adds seamless GUI support via XQuartz, allowing you to run both CLI and graphical Linux applications without the overhead of a heavy virtual machine.

## ✨ Features

* **🖥️ x86_64 Emulation:** Run legacy or x86-only Linux software on ARM Macs.
* **🎨 GUI Support:** Full X11 forwarding allows Linux apps to appear as native macOS windows.
* **🐳 Docker-Powered:** Uses the familiar Docker ecosystem for container management.
* **⚙️ Script-Driven:** Simplified workflow to handle complex networking and display flags.
* **🧪 Ideal for Testing:** Perfect for developers needing to test `amd64` binaries or environments.

---

## 🧠 How It Works

1.  **Host:** macOS running on Apple Silicon (ARM64).
2.  **Emulation:** Docker uses QEMU to translate `amd64` instructions for the ARM processor.
3.  **Display:** The containerized application sends X11 signals to the host's IP.
4.  **Rendering:** XQuartz receives the signals and renders the GUI as a native macOS window.

---

## 📦 Requirements

### Hardware
* **Apple Silicon Mac:** M1, M2, M3, or M4 series.

### Software
* **macOS:** 12.0 (Monterey) or newer recommended.
* **Docker Desktop for Mac:** [Download here](https://www.docker.com/products/docker-desktop/).
* **XQuartz:** [Download here](https://www.xquartz.org/).

---

## 🔧 Installation & Setup

### 1. Configure XQuartz
To allow Docker to talk to your Mac's display server:
1.  Open **XQuartz**.
2.  Go to **Settings** (or `Cmd + ,`) -> **Security**.
3.  Check the box: **"Allow connections from network clients"**.
4.  **Important:** Restart XQuartz (Quit and reopen) for changes to take effect.

### 2. Prepare the Host
Before running your container, allow the local machine to accept X11 connections:
```bash
xhost +localhost
