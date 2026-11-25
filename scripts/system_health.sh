#!/bin/bash

echo "=================================="
echo "       SYSTEM HEALTH REPORT"
echo "=================================="

echo "Date: $(date)"
echo "Hostname: $(hostname)"

echo ""
echo "----- CPU LOAD -----"

if [ -r /proc/loadavg ]; then
    echo "Load Average: $(cat /proc/loadavg | awk '{print $1, $2, $3}')"
else
    echo "CPU load information unavailable"
fi

echo ""
echo "----- MEMORY USAGE -----"

if [ -r /proc/meminfo ]; then
    awk '
    /MemTotal/ {total=$2}
    /MemAvailable/ {available=$2}
    END {
        used=total-available
        usage=(used/total)*100
        printf "Total Memory: %.2f GB\n", total/1024/1024
        printf "Used Memory: %.2f GB\n", used/1024/1024
        printf "Memory Usage: %.2f%%\n", usage
    }' /proc/meminfo
fi

echo ""
echo "----- DISK USAGE -----"

df -h /

echo ""
echo "=================================="
echo "       MONITORING COMPLETED"
echo "=================================="
