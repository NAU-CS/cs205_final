#1/bin/bash
 
# awk will calculate input from best_pokemon.dat

# make the filename the first positional parameter
filename=$1 

# awk will count number of lines and keep it as a variable
total= $(awk END {print NR} $filename) 

#awk will calculat the average HP and keep it as a variable
avg_hp= $(awk {sum += $6} END {print sum / NR} $filename) 

#awk will calculat the average attack and keep it as a variable
avg_attack= $(awk {sum += $7} END {print sum / NR} $filename) 

#print the summary of the data with echo
echo "===== SUMMARY OF $filename =====" 
echo "# Total Pokemon: $total"
echo "# Avg. HP: $avg_hp"
echo "# Avg. Attack: $avg_attack"
echo "===== END SUMMARY =====" 
