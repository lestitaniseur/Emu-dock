<p align="center">
  <a href="https://github.com/lestitaniseur/Emu-dock">
    <img src="https://github.com/lestitaniseur/Emu-dock/blob/main/logo.jpeg" alt="EmuDock Logo" width="120px"/>
  </a>
</p>

<h1 align="center"><b>EmuDock</b></h1>

<p align="center">
  <a href="#-installation">Installation</a> |
  <a href="#-usage">Usage</a> |
  <a href="https://github.com/lestitaniseur/Emu-dock/releases">Latest Release</a> |
  <a href="#-limitations">Limitations</a>
</p>

<div align="center">
  <img src="https://img.shields.io/github/v/release/lestitaniseur/Emu-dock?style=flat-square&color=blue" alt="Release" />
  <img src="https://img.shields.io/badge/Platform-macOS-blue?style=flat-square" alt="Platform" />
  <img src="https://img.shields.io/badge/Arch-x86__64-orange?style=flat-square" alt="Arch" />
</div>

<h5 align="center">
Run x86 Linux GUI applications seamlessly on Apple Silicon. ⭐️
</h5>

---

## 📖 About

**EmuDock** is a lightweight tool that allows you to run x86 (amd64) Linux environments on ARM-based Apple Silicon Macs (M1/M2/M3/M4) using Docker. 

By leveraging QEMU emulation and X11 forwarding via XQuartz, EmuDock lets you interact with graphical Linux software directly on your macOS desktop without the heavy resource cost of a traditional Virtual Machine.

> [!IMPORTANT]
> **Performance Note:** Because this uses emulation to run x86 code on ARM processors, applications will run slower than native ARM containers. This tool is intended for development and legacy software compatibility, not high-performance gaming.

---

## 📦 Requirements

* **Hardware:** Apple Silicon Mac (M-Series).
* **Docker Desktop:** Required for the container engine.
* **XQuartz:** Required for rendering the Linux GUI on macOS.

---

## 🔧 Installation

### 1. Configure XQuartz
1. Open **XQuartz** and go to `Settings` > `Security`.
2. Enable **"Allow connections from network clients"**.
3. **Restart your Mac** or log out/in to apply these system-level changes.

### 2. Enable X11 Access
Open your terminal and run:
```bash
xhost +localhost
