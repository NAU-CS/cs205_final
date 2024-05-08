# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

#store file name from positional parameter
file_name=$1

#calculate total number of pokemon
total_pokemon=$(awk 'NR > 1 {total++} END {print total}' FS="\t" "$file_name")

#calculate avereage hp
average_hp= $(awk 'NR > 1 {total_hp += 6} END {print total_hp / NR - 1}' FS="\t" "file_name")

#calculate the average attack
average_attack=$(awk 'NR > 1 {total_attack += $7} END {print total_attack / NR - 1}' FS="\t" "$file_name")

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
