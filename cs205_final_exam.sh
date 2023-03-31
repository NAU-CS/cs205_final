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


# Print summary output title
echo "===== SUMMARY OF DATA FILE ====="
# Print file name
echo "   File name: $1"
# print total of unique #s identifying a unique pokemon, ignoring the first line of the file, as well as printing message for total pokemon
awk 'NR>1{a[$1]} END {print "   Total Pokemon: ", length(a)}' "$1"

# print average of all values in 6th column, excluding first line
awk 'BEGIN{FS="\t"} NR>1{total+=$6; count++} END {print "   Avg. HP: ", total/count}' "$1"


awk 'BEGIN{FS="\t"} NR>1{total+=$7; count++} END {print "   Avg. Attack: ", total/count}' "$1"
