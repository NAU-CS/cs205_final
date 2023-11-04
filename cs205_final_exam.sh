#once this file is being executed after the command, it makes sure a file was provided and stores it into the variable file_name for later use.
data_file="$1"
file_name=$(basename "$data_file")

#since hp is in the 4th column, i create a variable called sum_hp in order to add each hp value to that sum using $4 to get the value from the 4th column of each line. then, i divide that by the NR variable, which counts the total number of lines that have been crossed over so far. This gives me the average hp for each pokemon. 
avg_hp=$(awk 'BEGIN { sum_hp = 0 } {sum_hp += $4} END {print sum_hp / NR}' "$data_file")
#I repeat the same exact process for attack, but instead of targetting column 4, we use column 5 since column 5 is what holds each pokemons attacking stat. Same thing, divide by NR that counts all the lines, and since we are doing this concurrently with HP it'll save computing power rather than iterating through everything twice. 
avg_attack=$(awk 'BEGIN { sum_atk = 0 } {sum_atk += $5} END {print sum_atk / NR}' "$data_file")
#to get the total pokemon, instead of iterating again after getting the averages, we can just print NR since that already holds the value for how many lines we have iterated over during the process we used to get the averages.
total_pokemon=$(awk 'END { print NR }' "$data_file")

#then just print the summary as instructed. basically just prints the variables we calculated above.
echo "===== SUMMARY OF DATA FILE ====="
echo "File name: $file_name"
echo "Total Pokemon: $total_pokemon)"
echo "Avg. HP: $avg_hp"
echo "Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="
