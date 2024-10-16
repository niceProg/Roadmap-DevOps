#!/bin/bash

# Function to get total CPU usage (using top on macOS)
get_cpu_usage() {
     echo "CPU Usage:"
     top -l 1 | grep "CPU usage" | awk '{print "Total CPU Usage: " $3 + $5 "%"}'
}

# Function to get total memory usage (using vm_stat on macOS)
get_memory_usage() {
     echo "Memory Usage:"
     vm_stat | perl -ne '/page size of (\d+)/ and $size=$1;
    /Pages free:\s+(\d+)/ and $free=$1;
    /Pages active:\s+(\d+)/ and $active=$1;
    /Pages inactive:\s+(\d+)/ and $inactive=$1;
    /Pages speculative:\s+(\d+)/ and $speculative=$1;
    /Pages wired down:\s+(\d+)/ and $wired=$1;
    /Pages occupied by compressor:\s+(\d+)/ and $compressed=$1;
    END {
        $total=($free+$active+$inactive+$speculative+$wired+$compressed)*$size/1048576;
        $used=($active+$wired+$compressed)*$size/1048576;
        $free=$free*$size/1048576;
        printf("Used: %.2fG / Total: %.2fG (%.2f%%)\n", $used/1024, $total/1024, ($used/$total)*100);
    }'
}

# Function to get total disk usage (same as Linux)
get_disk_usage() {
     echo "Disk Usage:"
     df -h / | grep '/$' | awk '{print "Used: "$3 " / Total: "$2 " (" $5 " used)"}'
}

# Function to get top 5 processes by CPU usage
get_top_cpu_processes() {
     echo "Top 5 processes by CPU usage:"
     ps -Ao pid,ppid,comm,%cpu --sort=-%cpu | head -6
}

# Function to get top 5 processes by memory usage
get_top_memory_processes() {
     echo "Top 5 processes by memory usage:"
     ps -Ao pid,ppid,comm,%mem --sort=-%mem | head -6
}

# Stretch goal: Get OS version, uptime, load average, logged in users
get_extra_info() {
     echo "OS Version: $(sw_vers -productVersion)"
     echo "Uptime: $(uptime | awk '{print $3 " " $4}')"
     echo "Load Average: $(sysctl -n vm.loadavg)"
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
