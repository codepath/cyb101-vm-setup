# Machine Set-Up

## The Easy Way (`install_tool.sh`)

- **Get a fresh linux VM with the following minimum specs:**
  - Ubuntu Server 20.04 LTS
  - 2 cores
  - 4GB RAM
  - 128GB Standard SSD

- **Download and run the `install_tool.sh` script**
  - This script will install all the tools and place all the files needed for the course
  - This might take a while (est 30-45m), so open Youtube or something
  - You will be able to choose between installing all units or just one unit at a time

## The Hard Way (Manual Set-Up)

### RDP Setup

> This must be done to allow for RDP connections to the student VM

- Run script: `~/Scripts/rdp_setup.sh`
- Tool(s) installed: `xrdp`, `xfce4`
- Files placed: None

### Unit 1: Lab

- N/A - VM is not used for Unit 1

### Unit 1: Project

- N/A - VM is not used for Unit 1

### Unit 2: Lab

- Run script: `~/Scripts/unit2_project.sh`
- Tool(s) installed: None
- Files placed: 
  - `~/unit2` directory created (empty)

### Unit 2: Project

- N/A - Nothing required for this project

### Unit 3: Lab

- Run script: `~/Scripts/unit3_lab.sh`
- Tool(s) installed: `john` (and dependencies)
- Files placed: 
  - `~/unit3/crackfiles.zip`

### Unit 3: Project

- Run script: `~/Scripts/unit3_project.sh`
- Tool(s) installed: None - `john` installed in lab script
- Files placed:
  - `~/unit3/cp_leak.txt`

### Unit 4: Lab

- Run script: `~/Scripts/unit4_lab.sh`
- Tool(s) installed: `firefox`
- Files placed: None
  
### Unit 4: Project

- Run script: `~/Scripts/unit4_project.sh`
- Tool(s) installed: `docker`, `Metasploitable` container, `metasploit`
- Files placed: None

### Unit 5: Lab

- Run script: `~/Scripts/unit5_lab.sh`
- Tool(s) installed: `vt-cli` and dependencies
- Files placed: None

### Unit 5: Project

- Run script: `~/Scripts/unit5_project.sh`
- Tool(s) installed: None - `vt-cli` installed in lab script
- Files placed: None

### Unit 6: Lab

- N/A - Lab runs in browser

### Unit 6: Project

- Run script: `~/Scripts/unit6_project.sh`
- Tool(s) installed: `steghide` and dependencies
- Files placed: See tree below

```sh
~
└── unit6
    ├── attrib.txt
    ├── cat.jpg
    ├── dog.jpg
    ├── forest.jpg
    ├── images.zip
    ├── message.txt
    ├── mountain.jpg
    └── salad.jpg
```

### Unit 7: Lab

- N/A - Lab runs in browser

### Unit 7: Project

- Run script: `~/Scripts/unit7_project.sh`
- Tool(s) installed: `curl`, `python3`, `python-is-python3`
- Files placed: None

### Unit 8: Lab

- Run script: `~/Scripts/unit8_lab.sh`
- Tool(s) installed: `setoolkit` and dependencies
- Files placed: None

### Unit 8: Project

- N/A - Nothing required for this project

### Unit 9+

- N/A - Nothing required for these units
