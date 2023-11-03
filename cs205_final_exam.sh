#!/bin/bash
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
# MY CODE STARTS HERE

# This first line skips the row with the descriptors of the Coloumn, AKA the words Name, HP, attack, all that stuff.
# Here I create a variable to store total value of the 6th column where tab's are my delimiter, thereby acessing hp and finding its total.
# Here I create a variable to store the total value of the 7th column, and in doing so find the total attack value of all pokemon.
# Here I specify after the file is done being read, as to not repeat the following code.
#Here I print my title.
#Here I print the file name
#Here I print total pokemon, which is equal to the amount of lines there are.
#Here I print the average HP, which is totalHP divided by total pokemon.
#Here I print the average attack, totalATK divided by total pokemon.
#Finally, I end the program with the end mess
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $1"
awk 'END{ {print "     Total Pokemon: ", NR}}' $1
cat $1 | awk '-F "\t" {NR>1} {TotalHP+=$6} END {{print "     Avg. HP: ", (TotalHP/NR)}}' $1
cat $1 | awk '-F "\t" {NR>1} {TotalATK+=$7} END {{print "   Avg. Attack: ", (TotalATK/NR)}}' $1 
echo "===== END SUMMARY ====="
