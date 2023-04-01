#!/bin/bash

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



# print first line
echo "===== SUMMARY OF DATA FILE ====="


# print start of the file name line without printing a new line
echo -n "   File name: "
#print the file name
echo $1


# print start of total pokemon without printing a new line
echo -n "   Total Pokemon: "
# print the total pokemon
awk "END{print NR-1}" $1


# print start of avg. hp  without printing a new line
echo -n "   Avg. HP: "
# calculate and print the average hp
awk -F '\t' ' NR != 1 {sum+=$6} END{print sum/(NR - 1)}' $1

# print the start of avg attack without printing a new line
echo -n "   Avg. Attack: "
# calculate and print the average hp
awk -F '\t' ' NR != 1 {sum+=$7} END{print sum/(NR - 1)}' $1
 


# print the last line
echo "===== END SUMMARY ====="
