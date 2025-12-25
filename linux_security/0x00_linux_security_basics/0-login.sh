#!/bin/bash

# This script requires privileged user (root or sudo) to execute

# Check if the script is being run as root or sudo user
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root or with sudo privileges." 
    exit 1
fi

# Display the last 5 login sessions for users (excluding system events)
echo "Last 5 login sessions (user, date, and time):"
last -n 5 | grep -vE 'reboot|shutdown|runlevel' | awk '{print "User: " $1 ", Date: " $4 " " $5 " " $6 ", Time: " $7}'
