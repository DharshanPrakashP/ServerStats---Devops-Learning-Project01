cpu_usage() {
    echo "CPU Usage:" 
    total_cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "Total CPU Usage: $total_cpu%"

    echo "Per-Core Breakdown:"
    mpstat -P ALL 1 1 | awk 'NR>3 {printf "Core %s: %.2f%%\n", $2, 100-$NF}'
}

memory_usage() {
    echo -e "\nMemory Statistics:"
    free -h | awk 'NR==2{printf "Total: %s | Used: %s | Free: %s | Usage: %.2f%%\n", $2, $3, $4, ($3/$2)*100}'
    
    echo "Swap Usage:"
    free -h | awk 'NR==3{printf "Total: %s | Used: %s | Free: %s\n", $2, $3, $4}'
}

disk_usage() {
    echo -e "\nDisk Usage Analysis:"
    df -h | awk 'NR==1 || !/tmpfs|udev/{printf "%-20s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $5}'
}

top_processes() {
    echo -e "\nTop 5 CPU-Intensive Processes:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -6 | awk '{printf "%-8s %-20s %s%%\n", $1, $2, $3}'
    
    echo -e "\nTop 5 Memory-Consuming Processes:"
    ps -eo pid,comm,%mem --sort=-%mem | head -6 | awk '{printf "%-8s %-20s %s%%\n", $1, $2, $3}'
}

system_info() {
    echo -e "\nSystem Information:"
    echo "OS Version: $(lsb_release -d | cut -f2)"
    echo "System Uptime: $(uptime -p)"
    echo "Load Average: $(cat /proc/loadavg | awk '{print $1, $2, $3}')"
    
    echo "Currently Logged-in Users:"
    who
    
    echo "Recent Failed Login Attempts:"
    if command -v journalctl &>/dev/null; then
        journalctl -xe | grep 'Failed password' | tail -5
    else
        grep "authentication failure" /var/log/auth.log | tail -5
    fi
    
    echo -e "\nNetwork Interface Statistics:"
    netstat -i | column -t
}

cpu_usage
memory_usage
disk_usage
top_processes
system_info
