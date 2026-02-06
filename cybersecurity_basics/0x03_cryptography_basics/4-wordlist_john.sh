#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt "$1" --format=raw-md5 && john --show --format=raw-md5 "$1" | cut -d: -f2 > 4-password.txt
