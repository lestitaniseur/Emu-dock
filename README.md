<p align="center">
  <img src="Logo.png" alt="EmuDock Logo" width="200">
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

**EmuDock** is a lightweight helper tool designed to bridge the gap between ARM-based Apple Silicon (M1/M2/M3) and legacy x86 (amd64) Linux environments. 

Instead of spinning up a resource-heavy Virtual Machine, EmuDock leverages Docker's built-in QEMU emulation and XQuartz to provide a seamless workflow for running both CLI and graphical Linux applications directly on macOS.

## ✨ Features

* **⚡ Seamless Emulation:** Automatic `x86_64` (amd64) translation on ARM hosts.
* **🎨 GUI Support:** Full X11 forwarding via XQuartz for graphical Linux apps.
* **🪶 Lightweight:** Minimal overhead compared to full-system virtualization (UTM/VMWare).
* **🛠 Simple Workflow:** Easy-to-use scripts to handle networking and display logic.
* **🧪 Development Ready:** Perfect for testing legacy binaries, proprietary x86 drivers, or Linux-only software.

## 🧠 How It Works



1.  **Host:** macOS running on Apple Silicon (ARM64).
2.  **Emulation:** Docker uses `binfmt_misc` and QEMU to execute `amd64` instructions.
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
2.  Go to `Settings` (or `Preferences`) -> `Security`.
3.  Check the box: **"Allow connections from network clients"**.
4.  **Important:** Restart XQuartz or log out/in for changes to take effect.

### 2. Prepare the Host
Before running a container, allow the local machine to accept X11 connections:
```bash
xhost +localhost
