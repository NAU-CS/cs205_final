#1/bin/bash
filename=$1

total_pokemon=$(awk 'END {print NR}' $filename)

avg_hp=$(awk '{sum += $4} END {print sum/NR}' $filename)
avg_attack=$(awk '{sum += $5} END {print sum/NR}' $filename)

echo "#======= Summary ======="
echo "#    File Name: $filename"
echo "#    Total Pokemon: $total_pokemon"
echo "#    Avg. HP: $avg_hp"
echo "#    Avg. Attack: $avg_attack"
echo "#======= End Summary ======="
