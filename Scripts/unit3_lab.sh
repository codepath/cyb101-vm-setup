#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
none='\033[0m'

echo "[UNIT 3 LAB] Starting script..."

# Move the crackfiles into the unit3_lab directory
if [ -e "$HOME/unit3_lab/crackfiles.zip" ]; then
    echo -e "[UNIT 3 LAB] File crackfiles.zip already found at ~/unit3_lab."
else
    echo "[UNIT 3 LAB] Moving files..."
    if [ -e "$HOME/Files/unit_3/crackfiles.zip" ]; then
        mkdir "$HOME/unit3_lab"
        echo "[UNIT 3 LAB] Moving crackfiles.zip to unit3_lab/crackfiles.zip..."
        sudo mv "$HOME/Files/unit-3/crackfiles.zip" "$HOME/unit3_lab/crackfiles.zip"
    else
        echo -e "${red}[UNIT 3 LAB]${none} Error: File ~/Files/unit_3/crackfiles.zip does not exist."
        exit 1
    fi
    # Verify move was successful
    if ! [ "$HOME/unit3_lab/crackfiles.zip" ]; then
        echo -e "${red}[UNIT 3 LAB]${none} Error: Could not move crackfiles.zip to unit_3/crackfiles.zip"
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