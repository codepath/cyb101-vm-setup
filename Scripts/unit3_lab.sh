#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
none='\033[0m'

echo "[UNIT 3 LAB] Starting script..."

# Copy the required file into the unit3 directory
if [ -e "$HOME/unit3/crackfiles.zip" ]; then
    echo -e "[UNIT 3 LAB] File crackfiles.zip already found at ~/unit3."
else
    if [ -e "$HOME/Files/unit3/crackfiles.zip" ]; then
        mkdir -p "$HOME/unit3"
        echo "[UNIT 3 LAB] Copying crackfiles.zip to unit3/crackfiles.zip..."
        sudo cp "$HOME/Files/unit3/crackfiles.zip" "$HOME/unit3/crackfiles.zip"
    else
        echo -e "${red}[UNIT 3 LAB]${none} Error: File ~/Files/unit3/crackfiles.zip does not exist."
        exit 1
    fi
    # Verify copy was successful
    if ! [ "$HOME/unit3/crackfiles.zip" ]; then
        echo -e "${red}[UNIT 3 LAB]${none} Error: Could not copy crackfiles.zip to unit3/crackfiles.zip"
        exit 1
    fi
fi

# Check if the script needs to run
if command -v john >/dev/null 2>&1 ; then
    echo -e "${green}[UNIT 3 LAB]${none} John is already installed."
    exit 0
fi
echo "[UNIT 3 LAB] Installing John..."

# Install John
sudo apt-get install john -y

# Print output based on whether or not John is installed
if command -v john >/dev/null 2>&1 ; then
    echo -e "${green}[UNIT 3 LAB]${none} John installed successfully."
else
    echo -e "${red}[UNIT 3 LAB]${none} ERROR: John was not installed correctly!"
    exit 1
fi
