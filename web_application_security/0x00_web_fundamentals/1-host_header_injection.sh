#!/bin/bash
curl -X POST -H "Host: $1" -H " $2" --data "$3"
