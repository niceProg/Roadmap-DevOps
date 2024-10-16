#!/bin/bash

# Function to get total CPU usage
get_cpu_usage() {
     echo "CPU Usage:"
     mpstat | awk '$12 ~ /[0-9.]+/ { print "Total CPU Usage: " 100 - $12"%"}'
}

# Function to get total memory usage
get_memory_usage() {
     echo "Memory Usage:"
     free -h | awk '/^Mem/ { print "Used: "$3 " / Total: "$2 " (" $3*100/$2 "%)"}'
}

# Function to get total disk usage
get_disk_usage() {
     echo "Disk Usage:"
     df -h --total | grep 'total' | awk '{ print "Used: "$3 " / Total: "$2 " (" $5 " used)"}'
}

# Function to get top 5 processes by CPU usage
get_top_cpu_processes() {
     echo "Top 5 processes by CPU usage:"
     ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -6
}

# Function to get top 5 processes by memory usage
get_top_memory_processes() {
     echo "Top 5 processes by memory usage:"
     ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -6
}

# Stretch goal: Get OS version, uptime, load average, logged in users
get_extra_info() {
     echo "OS Version: $(cat /etc/os-release | grep PRETTY_NAME | cut -d '=' -f 2)"
     echo "Uptime: $(uptime -p)"
     echo "Load Average: $(uptime | awk -F'load average:' '{print $2}')"
     echo "Logged in Users: $(who | wc -l)"
}

# Main function to call all other functions
main() {
     get_cpu_usage
     echo ""
     get_memory_usage
     echo ""
     get_disk_usage
     echo ""
     get_top_cpu_processes
     echo ""
     get_top_memory_processes
     echo ""
     echo "----- Optional Stretch Goals -----"
     get_extra_info
}

main
