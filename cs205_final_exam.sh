#!/bin/bash

file="pokemon.dat"
total=$(awk 'END{print NR}' $file)
avg_hp=$(awk '{sum+=$3} END{print sum/NR}' $file)
avg_atk=$(awk '{sum+=$4} END{print sum/NR}' $file)

echo "===== SUMMARY OF DATA FILE ====="
echo "File name: $file"
echo "Total Pokemon: $total"
echo "Avg. HP: $avg_hp"
echo "Avg. Attack: $avg_atk"
echo "===== END SUMMARY ====="
