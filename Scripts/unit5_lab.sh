#!/bin/bash
none='\033[0m'
green='\033[0;32m'
red='\033[0;31m'

echo "[UNIT 5 LAB] Starting script..."

# Check if vt-cli is installed
if command -v vt >/dev/null 2>&1 ; then
    echo -e "${green}[UNIT 5 LAB]${none} VirusTotal CLI (vt-cli) already installed."
    exit 0
fi

echo -e "[UNIT 5 LAB] Installing VirusTotal CLI..."
git clone https://github.com/VirusTotal/vt-cli
cd vt-cli

# Install Go if not already on system
if ! command -v go >/dev/null 2>&1 ; then
    echo -e "[UNIT 5 LAB] Installing Go..."
    sudo snap install go  --classic
fi
# Install make if not already on system
if ! command -v make >/dev/null 2>&1 ; then
    echo -e "[UNIT 5 LAB] Installing make..."
    sudo apt install -y make
fi

# Make the vt-cli installation and cleanup installation files
echo -e "[UNIT 5 LAB] Running vt-cli Makefile..."
make
make install
cd ..
rm -rf vt-cli

# Add GOBIN to PATH if not already there
if [[ -z "${GOBIN}" ]]; then
    echo -e "[UNIT 5 LAB] Adding Go to path..."
    echo 'export GOBIN=`go env GOPATH`/bin' >> ~/.profile
    echo 'export PATH=$PATH:$GOBIN' >> ~/.profile
    source ~/.profile
fi

# Check if vt-cli is installed
if command -v vt >/dev/null 2>&1 ; then
    echo -e "${green}[UNIT 5 LAB]${none} VirusTotal CLI (vt-cli) successfully installed."
    exit 0
else
    echo -e "${red}[UNIT 5 LAB]${none} Error: VirusTotal CLI (vt-cli) failed to install."
    exit 1
fi
