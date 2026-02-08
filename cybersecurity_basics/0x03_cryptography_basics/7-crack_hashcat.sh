#!/bin/bash
hashcat -m 500 -a 0 hash.txt /usr/share/wordlists/rockyou.txt "$1" > 7-password.txt
