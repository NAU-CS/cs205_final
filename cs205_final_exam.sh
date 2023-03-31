#!/bin/bash
#Gets filename from first position
filename=$1
#Usees awk to calculate the total number of pokemon
total_pkm=$(awk 'END {print NR}' $filename)
#Uses awk to calculate the average HP
avg_hp=$(awk '{sum += $6} END {print sum / NR}' $filename)
#Uses awk to calculate the average attack
avg_attk=$(awk '{sum += $7} END {print sum / NR}' $filename)
#Prints the summary
echo "======= SUMMARY OF DATA FILE ======"
echo "# File name: $filename"
echo "# Total Pokemon: $total_pkm"
echo "# Avg. HP: $avg_hp"
echo "# Avg. Attack: $avg_attk"
echo "# ======= END SUMMARY =======#"
