#!/bin/bash
echo -n "$1" | sha256sum | tr -d "-">>0-hash.txt
