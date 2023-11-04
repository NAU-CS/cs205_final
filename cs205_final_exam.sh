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
# The data file will be passed into the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

#!/bin/bash

# Check to see if there was exactly 1 argument entered
if [ "$#" -ne 1 ]; then
    # If more or less than 1 argument was presented, print this message
    echo "$0 requires 1 file as an argument."
    # and exit the script
    exit 1
fi

# Use the filename entered in the argument
file_name="$1"

# create summary, use awk to calculate values
summary=$(
    # let awk know it is separated by indentations
    awk -F '\t' '
    # skip the header line
    NR == 1 {
        # Go to the next line
        next
    }
    {
        # count the number of Pokemon
        total++
        # sum up the hp values
        hp += $6
        # sum up the attack values
        attack += $7
    }
    END {
        # calculate average health points
        avg_hp = hp / total
        # calculate the average attack
        avg_atk = attack / total
        # Print out the summary
        printf "===== SUMMARY OF DATA FILE =====\n"
        printf "    File name: %s\n", file_name
        printf "    Total Pokemon: %d\n", total
        printf "    Avg. HP: %.2f\n", avg_hp
        printf "    Avg. Attack: %.2f\n", avg_atk
        printf "===== END SUMMARY =====\n"
    }
' "$file_name")

# print the summary 
echo "$summary"
    





    
