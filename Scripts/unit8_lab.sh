#!/bin/bash
none='\033[0m'
green='\033[0;32m'
echo "[UNIT 8 LAB] Starting script..."

# First, check if steghide is installed
if command -v setoolkit &> /dev/null; then
    echo -e "${green}[UNIT 8 LAB]${none} setoolkit is already installed."
else
    git clone https://github.com/trustedsec/social-engineer-toolkit/ setoolkit/
    cd setoolkit
    pip3 install -r requirements.txt
    python setup.py
    if ! command -v setoolkit &> /dev/null; then
        echo -e "${red}[UNIT 8 LAB]${none} ERROR: setoolkit did not install!"
        exit 1
    else
        echo -e "${green}[UNIT 8 LAB]${none} setoolkit installed!"
    fi
fi


