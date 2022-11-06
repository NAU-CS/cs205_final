#!/bin/bash
# for printing file tital
FILE="$1"
# header
echo "===== SUMMARY OF DATA FILE ====="
#printing file name
echo "    File name: $FILE"
# incrementally prints pokemon
echo "    Total Pokemon: $(awk '{NUMPOKEMON += 1} END {print NUMPOKEMON}' $1)"
# divides total hp by pokemon
echo "    Avg. HP: $(awk '{HP += $6; NUM += 1} END{print HP / NUM}' $1)"
# same logic as hp
echo "    Avg. Attack: $(awk '{ATTACK += $7; NUMBER += 1} END{print ATTACK / NUMBER}' $1)"
# end 
echo "===== END SUMMARY ====="