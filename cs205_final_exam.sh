#!/bin/bash

awk '{ sum_hp += $5; sum_attack += $6; count++ } END { avg_hp = sum_hp/count; avg_attack = sum_attack/count; printf("===== SUMMARY OF DATA FILE =====\nFile name: %s\nTotal Pokemon: %d\nAvg. HP: %.2f\nAvg. Attack: %.2f\n===== END SUMMARY =====\n", FILENAME, count, avg_hp, avg_attack) }' "$1"

