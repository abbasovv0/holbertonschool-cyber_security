#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: $0 <subnet>"
  echo "Example: $0 192.168.65.0/24"
  exit 1
fi

SUBNET="$1"

nmap -sn -PR "$SUBNET"
