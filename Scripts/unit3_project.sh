#!/bin/bash
none='\033[0m'
red='\033[0;31m'
green='\033[0;32m'

echo "[UNIT 3 PROJECT] Starting script..."

# Copy the required file into the unit3 directory
if [ -e "$HOME/unit3/cp_leak.txt" ]; then
    echo -e "${green}[UNIT 3 PROJECT]${none} File cp_leak.txt already found at ~/unit3."
else
    if [ -e "$HOME/Files/unit3/cp_leak.txt" ]; then
        mkdir -p "$HOME/unit3"
        echo "[UNIT 3 PROJECT] Copying cp_leak.txt to unit3/cp_leak.txt..."
        sudo cp "$HOME/Files/unit3/cp_leak.txt" "$HOME/unit3/cp_leak.txt"
        sudo chown $USER:$USER "$HOME/unit3/cp_leak.txt"
    else
        echo -e "${red}[UNIT 3 PROJECT]${none} Error: File ~/Files/unit3/cp_leak.txt does not exist."
        exit 1
    fi
    # Verify copy was successful
    if ! [ "$HOME/unit3/cp_leak.txt" ]; then
        echo -e "${red}[UNIT 3 PROJECT]${none} Error: Could not copy cp_leak.txt to unit3/cp_leak.txt"
        exit 1
    else
        echo -e "${green}[UNIT 3 PROJECT]${none} File cp_leak.txt copied successfully."
    fi
fi

# Verify John is installed
if ! command -v john-the-ripper >/dev/null 2>&1 ; then
    echo -e "${red}[UNIT 3 PROJECT]${none} Error: John (snap) is not installed.  Please run Unit 3 Lab script."
    exit 1
fi