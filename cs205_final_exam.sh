!#/bin/bash

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

# Getting file name for the first positional parameter
FILE=$1

# Print Title Line
echo "===== SUMMARY OF DATA FILE ====="

# Printing File Name and using the file name 
echo "   File name: $FILE"

# The awk is going to count every line but the first for pokemon count
# We also include $FILE again to make sure to maintains the file we are looking at 
awk 'END {print "    Total Pokemon: " (NR-1)}' $FILE

# Finds the average of health points for pokemon
# awk calculates the sum and then the sum is going to be divided by the parameter or make sure that the first line is not counted
awk 'NR > 1 {sum += $6} END{print "    Avg. HP: " (sum/NR-1)}' $FILE

# Finds the average of attack for pokemon
# similar to the previous line where we use the sum but using the 7th column instead of the 6th
awk 'NR > 1 {sum += $6} END{print "    Avg. Attack: " (sum/NR-1)}' $FILE

# Printing End Summary
echo "===== END SUMMARY ====="
