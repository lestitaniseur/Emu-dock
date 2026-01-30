#!/usr/bin/env bash
set -e

### ===== Constants =====
PLATFORM="linux/amd64"

DEBIAN_IMAGE="debian:bookworm"
UBUNTU_IMAGE="ubuntu:22.04"
XFCE_IMAGE="linuxserver/webtop:debian-xfce"

CONTAINERS=(
  "emudock-debian"
  "emudock-ubuntu"
  "emudock-xfce"
)

### ===== Menu options =====
OPTIONS=(
  "Debian CLI (minimal)"
  "Ubuntu CLI (minimal)"
  "Debian XFCE (full desktop)"
  "Install ALL"
  "Exit"
)

SELECTED=0

### ===== UI helpers =====
tput civis

draw_menu() {
  clear
  # Define colors
  local C_GREEN='\033[32m'
  local C_BLUE='\033[34m'
  local C_RESET='\033[0m'
  
  # Custom ASCII Art provided by user
  # Escaped backslashes (\\) and backticks (\`) for Bash
  local L1=" ___________               ________                 __    "
  local L2=" \\_   _____/ _____  __ __  \\______ \\   ____   ____ |  | __"
  local L3="  |    __)_ /     \\|  |  \\  |    |  \\ /  _ \\_/ ___\\|  |/ /"
  local L4="  |        \\  Y Y  \\  |  /  |    \`   (  <_> )  \\___|    < "
  local L5=" /_______  /__|_|  /____/  /_______  /\\____/ \\___  >__|_ \\"
  local L6="         \\/      \\/                \\/            \\/     \\/"

  echo ""
  
  # Lines 1-3: Art only (Green)
  printf "${C_GREEN}%s${C_RESET}\n" "$L1"
  printf "${C_GREEN}%s${C_RESET}\n" "$L2"
  printf "${C_GREEN}%s${C_RESET}\n" "$L3"
  
  # Line 4: Art + URL (Blue)
  printf "${C_GREEN}%s${C_RESET}   ${C_BLUE}https://github.com/lestitaniseur/Emu-dock${C_RESET}\n" "$L4"
  
  # Line 5: Art + Tagline (Green)
  printf "${C_GREEN}%s${C_RESET}   ${C_GREEN}Run x86 Linux on Apple Silicon.${C_RESET}\n" "$L5"

  # Line 6: Art footer (Green)
  printf "${C_GREEN}%s${C_RESET}\n" "$L6"
  
  echo ""
  echo "  Select environment to install:"
  echo ""

  for i in "${!OPTIONS[@]}"; do
    if [[ $i -eq $SELECTED ]]; then
      # Highlight selected option
      tput setaf 0; tput setab 6; tput bold
      printf "  ➤ %s\n" "${OPTIONS[$i]}"
      tput sgr0
    else
      printf "    %s\n" "${OPTIONS[$i]}"
    fi
  done
  echo ""
}

### ===== Helper functions =====
check_internet() {
  echo ""
  echo "Checking internet connectivity..."
  if ! ping -c 1 -W 2 github.com >/dev/null 2>&1; then
    echo "❌ No internet connection detected. Cannot continue."
    exit 1
  fi
  echo "✅ Internet OK"
  echo ""
}

check_docker() {
  if ! command -v docker >/dev/null 2>&1; then
    echo ""
    echo "Installing Docker Desktop via Homebrew..."
    brew install --cask docker
    echo "⚠️ Start Docker Desktop manually and re-run the script."
    exit 0
  fi

  if ! docker info >/dev/null 2>&1; then
    echo "❌ Docker installed but not running. Start Docker Desktop."
    exit 1
  fi
  echo "✅ Docker OK"
  echo ""
}

check_xquartz() {
  if ! command -v xquartz >/dev/null 2>&1; then
    echo ""
    echo "Installing XQuartz via Homebrew..."
    brew install --cask xquartz
    echo "⚠️ XQuartz installed. Log out or reboot macOS."
    exit 0
  fi
  echo "✅ XQuartz OK"
  echo ""
}

enable_x11() {
  echo "Enabling X11 access..."
  xhost +localhost >/dev/null
  echo ""
}

### ===== Main interactive selection =====
while true; do
  draw_menu
  IFS= read -rsn1 key
  case "$key" in
    $'\x1b')
      read -rsn2 key
      case "$key" in
        '[A') ((SELECTED--)) ;;
        '[B') ((SELECTED++)) ;;
      esac
      ;;
    "") break ;;
  esac
  ((SELECTED < 0)) && SELECTED=$((${#OPTIONS[@]} - 1))
  ((SELECTED >= ${#OPTIONS[@]})) && SELECTED=0
done

tput cnorm
clear

### ===== Pre-checks =====
check_internet
check_docker
check_xquartz
enable_x11

### ===== Install selected =====
install_list=()
case $SELECTED in
  0) install_list=("debian") ;;
  1) install_list=("ubuntu") ;;
  2) install_list=("xfce") ;;
  3) install_list=("debian" "ubuntu" "xfce") ;;
  4) echo "Exit selected"; exit 0 ;;
esac

for item in "${install_list[@]}"; do
  case $item in
    "debian")
      echo "Pulling Debian CLI..."
      docker pull --platform $PLATFORM $DEBIAN_IMAGE
      docker rm -f emudock-debian >/dev/null 2>&1 || true
      docker create \
        --name emudock-debian \
        --platform $PLATFORM \
        $DEBIAN_IMAGE
      ;;
    "ubuntu")
      echo "Pulling Ubuntu CLI..."
      docker pull --platform $PLATFORM $UBUNTU_IMAGE
      docker rm -f emudock-ubuntu >/dev/null 2>&1 || true
      docker create \
        --name emudock-ubuntu \
        --platform $PLATFORM \
        $UBUNTU_IMAGE
      ;;
    "xfce")
      echo "Pulling Debian XFCE..."
      docker pull --platform $PLATFORM $XFCE_IMAGE
      docker rm -f emudock-xfce >/dev/null 2>&1 || true
      docker create \
        --name emudock-xfce \
        --platform $PLATFORM \
        $XFCE_IMAGE
      ;;
  esac
done

echo ""
echo "✅ Installation complete!"