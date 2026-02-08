#!/bin/bash
hashcat -m 0 "$1" wordlist.txt && hashcat -m 0 "$1" --show | cut -d: -f2 > 9-password.txt
