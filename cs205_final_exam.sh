#store file name from positional parameter
file_name=$1

#calculate total number of pokemon
total_pokemon=$(awk 'NR > 1 {total++} END {print total}' FS="\t" "$file_name")

#calculate average hp
average_hp=$(awk 'NR > 1 {total_hp += $6} END {print total_hp / (NR - 1)}' FS="\t" "$file_name")

#calculate the average attack
average_attack=$(awk 'NR > 1 {total_attack += $7} END {print total_attack / (NR - 1)}' FS="\t" "$file_name")

#print the summary of our data
#header
echo "===== SUMMARY OF DATA FILE ====="
#file name
echo "    File name: $file_name"
#total pokemon
echo "    Total Pokemon: $total_pokemon"
#average hp
echo "    Avg. HP: $average_hp"
#average attack
echo "    Avg. Attack: $average_attack"
#footer
echo "===== END SUMMARY ====="
