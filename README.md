# System Monitoring Script

## 📌 Description
This Bash script provides a comprehensive system usage report, including CPU, memory, disk, and network statistics, along with system uptime and top processes. It helps users monitor system resource utilization efficiently.

## ✨ Features
- **CPU Usage**: Displays total CPU usage and per-core breakdown.
- **Memory Usage**: Shows total, used, and free memory, along with swap usage.
- **Disk Usage**: Provides an overview of disk space usage.
- **Top Processes**: Lists the top 5 CPU-intensive and memory-consuming processes.
- **System Information**: Includes OS details, uptime, load average, logged-in users, and failed login attempts.
- **Network Statistics**: Displays network interface statistics.

## 📦 Prerequisites
Ensure the following utilities are installed:
- `top`
- `awk`
- `mpstat` (from the `sysstat` package)
- `free`
- `df`
- `ps`
- `who`
- `journalctl` (for system logs)
- `netstat` (from `net-tools` package)

## 🚀 Usage
1. Make the script executable:
   ```bash
   chmod +x system_monitor.sh
   ```
   ```bash
   ./server_monitor.sh

## project inspired from 
 - Roadmap.sh
https://roadmap.sh/projects/server-stats
