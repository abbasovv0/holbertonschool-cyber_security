#!/bin/bash
echo -n "$1" | openssl dgst -sha256 rand -hex 8 | tr -d "-">>3_hash.txt
