#!/bin/bash
none='\033[0m'
green='\033[0;32m'
echo "[UNIT 6 PROJECT] Starting script..."

# First, check if steghide is installed
if command -v steghide &> /dev/null; then
    echo -e "${green}[UNIT 6 PROJECT]${none} Steghide is already installed."
else
    sudo apt install -y steghide
    if ! command -v steghide &> /dev/null; then
        echo -e "${red}[UNIT 6 PROJECT]${none} ERROR: Steghide did not install!"
        exit 1
    fi
fi

# Create the unit6 folder if it doesn't exist
if [ ! -d "$HOME/unit6" ]; then
    mkdir "$HOME/unit6"
fi

# Copy the files from the unit6 project into the unit6 folder
# Copy the required file into the unit3 directory
if [ -e "$HOME/unit6/images.zip" ]; then
    echo -e "${green}[UNIT 6 PROJECT]${none} File images.zip already found at ~/unit6."
else
    if [ -e "$HOME/Files/unit6/images.zip" ]; then
        mkdir -p "$HOME/unit6"
        echo "[UNIT 6 PROJECT] Copying images.zip to unit6/images.zip..."
        sudo cp "$HOME/Files/unit6/images.zip" "$HOME/unit6/images.zip"
    else
        echo -e "${red}[UNIT 6 PROJECT]${none} Error: File ~/Files/unit6/images.zip does not exist."
        exit 1
    fi
    # Verify copy was successful
    if ! [ "$HOME/unit6/images.zip" ]; then
        echo -e "${red}[UNIT 6 PROJECT]${none} Error: Could not copy images.zip to unit6/images.zip"
        exit 1
    else
        # Unzip the images.zip file
        cd ~/unit6
        unzip images.zip
        echo -e "${green}[UNIT 6 PROJECT]${none} File images.zip copied successfully."
    fi
fi

