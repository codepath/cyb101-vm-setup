#!/bin/bash
none='\033[0m'
green='\033[0;32m'
red='\033[0;31m'

echo "[UNIT 4 PROJECT] Starting script..."

# First, check if docker is installed
if command -v docker &> /dev/null; then
    echo -e "[UNIT 4 PROJECT] Docker is already installed."
else
    sudo apt install -y docker.io
    if ! command -v docker &> /dev/null; then
        echo -e "${red}[UNIT 4 PROJECT]${none} ERROR: Docker did not install!"
        exit 1
    fi
fi

# Next, check if the docker service is running
if systemctl is-active --quiet docker; then
    echo -e "[UNIT 4 PROJECT] Docker is already installed and running."
else
    sudo systemctl enable docker --now
    if ! systemctl is-active --quiet docker; then
        echo -e "${red}[UNIT 4 PROJECT]${none} ERROR: Docker did not start!"
        exit 1
    fi
fi

# Check if the user $USER is in the docker group
if groups $USER | grep &>/dev/null '\bdocker\b'; then
    echo -e "[UNIT 4 PROJECT] User $USER is already in the docker group."
else
    sudo gpasswd -a $USER docker
    if ! groups $USER | grep &>/dev/null '\bdocker\b'; then
        echo -e "${red}[UNIT 4 PROJECT]${none} ERROR: User $USER was not added to the docker group!"
        exit 1
    fi
fi

# Install the docker image
if sudo docker ps -a | grep &>/dev/null '\bmetasploitable\b'; then
    echo -e "${green}[UNIT 4 PROJECT]${none} Metasploitable already running."
else
    sudo docker run --name metasploitable -it tleemcjr/metasploitable2:latest sh -c "/bin/services.sh && bash"
    
    # Check if the docker image is running
    if sudo docker ps -a | grep &>/dev/null '\bmetasploitable\b'; then
        echo -e "${green}[UNIT 4 PROJECT]${none} Metasploitable is now running."
    else
        sudo docker start -ai metasploitable
        if ! sudo docker ps -a | grep &>/dev/null '\bmetasploitable\b'; then
            echo -e "${red}[UNIT 4 PROJECT]${none} ERROR: Docker image metasploitable did not start!"
            exit 1
        fi
    fi
fi

### Part 2: Install Metasploit

# Check if Metasploit is already installed
if command -v msfconsole &> /dev/null; then
    echo -e "${green}[UNIT 4 PROJECT]${none} Metasploit is already installed."
    exit 0
fi

# Install prerequisites
# sudo apt install postgresql postgresql-contrib
# sudo systemctl enable postgresql --now

# Install Metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall

# Initialize the database
#sudo msfdb init

# Check if Metasploit is installed
if command -v msfconsole &> /dev/null; then
    echo -e "${green}[UNIT 4 PROJECT]${none} Metasploit installed successfully."
else
    echo -e "${red}[UNIT 4 PROJECT]${none} ERROR: Metasploit did not install!"
    exit 1
fi
