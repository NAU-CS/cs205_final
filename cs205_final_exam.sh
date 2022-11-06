#!/bin/bash
FILE="$1"
echo "===== SUMMARY OF DATA FILE ====="
echo "    File name: $FILE"
echo "    Total Pokemon: $(awk 'END {print $1}' $1)"