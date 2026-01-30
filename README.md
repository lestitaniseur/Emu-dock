<p align="center">
  <a href="https://github.com/lestitaniseur/Emu-dock">
    <img src="https://github.com/lestitaniseur/Emu-dock/blob/main/logo.png" alt="EmuDock Logo" width="270px"/>
  </a>
</p>

<h1 align="center"><b>EmuDock</b></h1>

<p align="center">
  <a href="#-about">About</a> |
  <a href="#-supported-environments">Environments</a> |
  <a href="#-requirements">Requirements</a> |
  <a href="#-installation">Installation</a> |
  <a href="#-usage">Usage</a> |
  <a href="#-limitations">Limitations</a>
</p>

---

## 📖 About

**EmuDock** is a helper tool that simplifies running **x86_64 (amd64) Linux environments** on **ARM-based Apple Silicon Macs** using Docker and QEMU emulation.

It is designed for:
- Development
- Legacy x86 Linux software
- GUI and CLI Linux workflows
- Avoiding heavy virtual machines

EmuDock automates Docker flags, architecture handling, and GUI setup.

---

## 🧠 Supported Environments

EmuDock provides **multiple Linux environments**, each serving a different purpose.

### 🟦 Debian (CLI)

**Type:** Minimal command-line Linux  
**Architecture:** x86_64 (emulated)  
**GUI:** ❌ No  

**Description:**  
A lightweight Debian container intended for:
- CLI tools
- Package testing
- Development
- Scripting
- Server-like workloads

**What it does:**
- Runs a minimal Debian userspace
- Uses Docker’s x86 emulation
- Starts in a shell
- No desktop environment

**Use when:**
- You don’t need a GUI
- You want the smallest footprint
- You want Debian stability

---

### 🟧 Ubuntu (CLI)

**Type:** Minimal command-line Linux  
**Architecture:** x86_64 (emulated)  
**GUI:** ❌ No  

**Description:**  
An Ubuntu-based container for users who prefer:
- Ubuntu tooling
- PPAs
- Ubuntu documentation ecosystem

**What it does:**
- Runs Ubuntu userspace on ARM via QEMU
- Provides apt, snap support (CLI)
- Starts in terminal mode

**Use when:**
- You need Ubuntu-specific packages
- You are testing Ubuntu-targeted software
- You don’t need a GUI

---

### 🟩 Debian XFCE (Full Desktop)

**Type:** Full Linux desktop  
**Architecture:** x86_64 (emulated)  
**GUI:** ✅ Yes (XFCE)  

**Description:**  
A **complete lightweight Linux desktop environment** running inside Docker.

This is the closest thing to a “full Linux distro” EmuDock provides.

**What it does:**
- Runs Debian with XFCE desktop
- Provides window manager, file manager, terminal
- Supports GUI applications
- Displays via XQuartz or web/VNC (depending on setup)
- Persistent home directory

**Use when:**
- You need GUI applications
- You want a desktop-like experience
- You want to run browsers, editors, tools

> 💡 Recommended option for most users.

---

### 🧩 Install All Environments

**Description:**  
Pulls **all supported images** at once.

**What it does:**
- Downloads Debian CLI
- Downloads Ubuntu CLI
- Downloads Debian XFCE desktop
- Lets you choose which one to launch later

**Use when:**
- You want maximum flexibility
- You switch between environments often

---

## 📦 Requirements

### Hardware
- Apple Silicon Mac (M1 / M2 / M3 / M4)

### Software
- macOS 12+ 
- Homebrew

---

## 🔧 Installation

1. Clone the repository:

```bash
git clone https://github.com/lestitaniseur/Emu-dock.git
cd Emu-dock
```
2. make the script executable 

```bash
chmod +x Installer.sh
```

3. Run the installer 
```bash
./Installer.sh
```

4.	Follow the interactive menu to choose what to install:

	•	Debian CLI
	•	Ubuntu CLI
	•	Debian XFCE (full desktop)
	•	Install ALL
	•	Exit

The menu uses arrow keys and color highlights for easy navigation.

---


🗂 Persistent Containers & Aliases

After installation, the following containers are created :


## Command Example

```bash
alias debian='docker start -ai emudock-debian'
```

```bash
alias ubuntu='docker start -ai emudock-ubuntu'
```

```bash
alias xfce='docker start -ai emudock-xfce'
````

##test