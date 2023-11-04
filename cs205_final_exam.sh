#!/bin/bash

if [ $# -ne 1 ]; then
     echo "Please use a file"
     exit 1
fi

file="$1"

summary=$(awk -F'\t' 'BEGIN {
     total_pokemon = 0
     total_hp=0
     total_attack = 0
}

NR > 1 { 
     total_pokemon++
     total_hp+=$6
     total_attack += $7
}

END { 
     avg_hp = total_hp / total_pokemon
     avg_attack = total_attack / total_pokemon

     printf("===== SUMMARY OF DATA FILE =====\n")
     printf("    File name: %s\n", ARGV[1])
     printf("    Total Pokemon: %d\n", total_pokemon)
     printf("    Avg. HP: %.2f\n", avg_hp)
     printf("    Avf. Attack: %.2f\n", avg_attack)
     printf("===== END SUMMARY =====\n")
}' "$file")

echo "$summary"
exit 0
