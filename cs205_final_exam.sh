# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

#!/bin/bash
#setting the first parameter to a variable called file
file=$1
#print the file name
echo "File name:" $file
#save the total number of pokemon to a variable
total=$(awk 'END {print $1}' $file)
#print the total number of pokemon
echo "Total Pokemon:" $total
#use awk to calculate and print the avg. hp
awk -F'\t' '{hp += $6} END {print"Avg. HP: " hp/$total}' $file
#use awk to calculate and print the avg attack
awk -F'\t' '{attack += $7} END {print"Avg. Attack: " attack/$total}' $file
