
!/bin/sh

file_name=$1
total_pokemon=$(awk 'NR> {count++} END {print count}' $file_name)
avg_attack=$(awk -F'\t' 'NR>1 {sum+= $7} END {print sum/NR-1)}' $file_name)
echo " ===== SUMMARY OF DATA FILE ====="
echo "    File name: [VALUE]"
echo "    Total Pokemon: [VALUE]"
echo "    Avg. HP: [VALUE]"
echo " ===== END SUMMARY ====="
