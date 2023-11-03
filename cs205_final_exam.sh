# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====
#!/bin/bash

filename=$1
# this will get the file name in the first position parameter
total=$ (awk 'END {print NR}' $best_pokemon.dat
#This calculates the total number of pokemon
AvgHP=$ (awk '{sum += $3} END {print sum/ NR }' $bestpokemon.dat)
# take the sum of the third positional parameter and divide by the total number of pokemon
AvgAttack=$ (awk '{sum += $4} END {print sum/ NR}' $best_pokemon.dat)
# the sum of all the attacks divided by all the pokemon

echo "===== SUMMARY OF DATA FILE====="
echo "   File name: $filename"
echo "   Total Pokemon: $total"
echo "   Avg. HP: $AvgHP"
echo "   Avg. Attack: $AvgAttack"
echo " ===== END SUMMARY =====


# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
