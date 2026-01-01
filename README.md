<p align="center">
  <a href="https://github.com/lestitaniseur/Emu-dock">
    <img src="https://github.com/lestitaniseur/Emu-dock/blob/main/logo.png?raw=true" alt="EmuDock Logo" width="200">
  </a>
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

---

## 📦 Requirements

### Hardware
* **Apple Silicon Mac:** M1, M2, M3, or M4 series.

### Software
1. **Docker Desktop for Mac:** [Download here](https://www.docker.com/products/docker-desktop/).
2. **XQuartz:** [Download here](https://www.xquartz.org/).

---

## 🔧 Installation & Setup

### 1. Configure XQuartz
1.  Open **XQuartz**.
2.  Go to **Settings** (or `Cmd + ,`) -> **Security**.
3.  Check **"Allow connections from network clients"**.
4.  **Restart XQuartz** (Quit and reopen).

### 2. Prepare the Host
Run this in your macOS terminal:
```bash
xhost +localhost
