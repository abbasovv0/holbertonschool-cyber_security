#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt "$1" --format=Raw-SHA256 && john --show --format=Raw-SHA256 "$1" > 6-password.txt
