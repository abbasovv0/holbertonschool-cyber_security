#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root or with sudo privileges." 
    exit 1
fi

echo "Last 5 login sessions (user, date, and time):"
last -n 5 | awk '{print "User: " $1 ", Date: " $4 " " $5 " " $6 ", Time: " $7}'
