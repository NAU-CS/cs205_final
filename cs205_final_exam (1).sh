#!/bin/bash

filename=$1
total=$(awk 'END {print NR}' pokemon.dat)
avg_hp=$(awk '{sum += $4} END {print sum / NR}' pokemon.dat)
avg_attack=$(awk '{sum += $5} END {print sum / NR}' pokemon.dat)
echo "====== SUMMARY OF POKEMON.DAT ======"
echo "# total pokemon: $total"
echo "# Avg. HP: $avg_hp"
echo "# AVG attack: $avg_attack"
echo "# ====== END SUMMARY ====== #"

