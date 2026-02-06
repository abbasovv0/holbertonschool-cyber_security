#!/bin/bash
echo -n "$1" | openssl dgst -sha1 | tr -d "-">>3_hash.txt
