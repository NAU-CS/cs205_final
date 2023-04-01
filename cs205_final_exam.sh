#!/bin/bash

filename = $1
total = $(awk 'END{print NR}' $filename)
avg_hp = $(awk '{sum += $3} END {print sum / NR}' $filename)
avg_attack = $(awk '{sum += $4} END {print sum / NR}' $filename=

echo # ===== SUMMARY OF DATA FILE =====
echo #    File name: [$filename]
echo #    Total Pokemon: [$total]
echo #    Avg. HP: [$avg_hp]
echo #    Avg. Attack: [$avg_attack]
echo # ===== END SUMMARY =====

