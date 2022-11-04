#!/bin/bash

FILENAME=$1


tot_pok=awk '{NR-1}' $FILENAME


avg_hp=awk -F '\t' '{sum+=$5NR>1}END{print sum / (NR-1) }' $FILENAME


avg_att=awk -F '\t' '{sum+=$6NR>1}END{print sum / (NR-1) }' $FILENAME

echo " ===== SUMMARY OF DATA FILE ====="
echo "    File name:  $FILENAME"
echo "    Total Pokemon: $tot_pok"
echo "    Avg. HP: $avg_hp"
echo "    Avg. Attack: $avg_att"
echo " ===== END SUMMARY ====="
