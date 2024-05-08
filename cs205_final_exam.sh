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

# initialize fileName variable as the initial field
fileName=$1

# echo heading
echo "===== SUMMARY OF DATA FILE ====="

# echo the file name using fileName variable
echo "   File name: $fileName"

# calculate total Pokemon and store in totalPokemon variable
# process file line by line with awk
# increment count for each line except for the first line
# print the count
totalPokemon=$(awk 'NR > 1 {count++} END {print count}' $fileName)

# echo total Pokemon using totalPokemon variable
echo "   Total Pokemon: $totalPokemon"

# calculate average HP and store in avgHP variable
# process file line by line with awk
# add up the HP from previous total (HP is 6th field)
# divide sum by the total number of lines
avgHP=$(awk 'NR > 1 {total += $6} END {print total / NR}' $fileName)

# calculate average Attacl and store in avgAtt variable
# process file line by line with awk
# add up the Attack from previous total (Attack is 7th field)
# divide sum by the total number of lines
avgAtt=$(awk 'NR > 1 {total += $7} END {print total / NR}' $fileName)

# echo the average HP using avgHP variable
echo "   Avg. HP: $avgHP"

# echo the average Attack using avgAtt variable
echo "   Avg. Attack: $avgAtt"

# echo footer
echo "===== END SUMMARY ====="
