#!/bin/bash
input="${1#"{xor}"}"
echo "$input" | base64 -d | perl -ne 'print $_ ^ "_" x length'
