# Server Stats Monitoring Script
This project contains a bash script `server-stats.sh` that helps monitor basic server performance stats on any Linux server. It provides insights into CPU, memory, disk usage, and the top processes by CPU and memory usage. Additionally, it includes optional extra information such as OS version, uptime, and load averages.

## Features
- **Total CPU Usage**: Displays total CPU usage as a percentage.
- **Total Memory Usage**: Displays used and free memory along with the percentage of usage.
- **Total Disk Usage**: Shows used and free disk space, including the percentage of disk space used.
- **Top 5 Processes by CPU Usage**: Lists the top 5 processes consuming the most CPU.
- **Top 5 Processes by Memory Usage**: Lists the top 5 processes consuming the most memory.
- **Optional Stretch Stats**: Includes OS version, system uptime, load averages, and the number of logged-in users.

## Prerequisites
- Linux-based system (Ubuntu, CentOS, etc.)
- Bash shell
- The following packages need to be installed:
  - `sysstat` (for CPU usage monitoring via `mpstat`)
  - `procps` (for process monitoring via `ps`)

### Installing Required Packages
To ensure you have all the necessary packages installed, run the following commands:

```bash
# Install sysstat for CPU monitoring
sudo apt update && sudo apt install sysstat -y   # For Ubuntu/Debian
sudo yum install sysstat -y                      # For CentOS/RHEL

# Install procps (usually pre-installed on most systems)
sudo apt install procps -y
sudo yum install procps -y
```

## Usage on Based Linux
### 1. Clone the repository
```bash
git clone <repository-url>
cd <repository-directory>
```

### 2. Make the script executable
Before running the script, you need to give it executable permission:
```bash
chmod +x server-stats.sh
```

### 3. Run the script
To run the script and view the server stats, execute:
```bash
./server-stats.sh
```

### 4. Output
```bash
CPU Usage:
Total CPU Usage: 59.05%

Memory Usage:
Used: 1.2Gi / Total: 7.7Gi (15.5844%)

Disk Usage:
Used: 62G / Total: 136G (48% used)

Top 5 processes by CPU usage:
    PID    PPID CMD                         %CPU
   2559    2538 /vscode/bin/linux-x64/384ff  5.5
   2538    2529 /vscode/bin/linux-x64/384ff  2.4
   3071    2538 /vscode/bin/linux-x64/384ff  0.6
   2607    2538 /vscode/bin/linux-x64/384ff  0.1
   3089    2559 /vscode/bin/linux-x64/384ff  0.1

Top 5 processes by memory usage:
    PID    PPID CMD                         %MEM
   2559    2538 /vscode/bin/linux-x64/384ff  3.7
   2538    2529 /vscode/bin/linux-x64/384ff  1.3
    991       1 dockerd --dns 168.63.129.16  0.9
   3071    2538 /vscode/bin/linux-x64/384ff  0.8
   2607    2538 /vscode/bin/linux-x64/384ff  0.6

----- Optional Stretch Goals -----
OS Version: "Ubuntu 20.04.6 LTS"
Uptime: up 6 minutes
Load Average:  1.12, 2.46, 1.30
Logged in Users: 0
```

## Usage on macOS
This script can also be run on macOS with some adjustments.

### Prerequisites for macOS
### 1. Install Homebrew (if not already installed):
   Homebrew is a package manager for macOS that will allow you to install the necessary tools.

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
### 3. Install Required Packages:

You'll need to install some tools that are not included by default on macOS.

- **mpstat**: Part of the sysstat package, which is not available for macOS. You can replace this functionality with top for CPU usage stats.
- **gnu-sed** (optional): If you encounter issues with sed due to macOS's built-in version, you can install GNU sed for better compatibility.
Install these packages via Homebrew:
```bash
# Install coreutils for GNU tools (includes gsed if needed)
brew install coreutils

# Install glances (for system monitoring), as mpstat is not available
brew install glances
```

### Running the Script on macOS
After cloning the repository and navigating to the directory, make the script executable:
```bash
chmod +x macos-stat.sh
```
### Run the script:
```bash
./macos-stat.sh
```