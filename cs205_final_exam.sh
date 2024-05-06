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
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat.
# However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

#!/bin/bash

# This script processes a Pokémon data file and outputs a formatted summary report.
# It calculates the total number of Pokémon, their average HP, and average Attack from a provided CSV file.

# Check if a file name is provided and the file exists
if [ $# -eq 0 ] || [ ! -f "$1" ]; then
    echo "Error: No file provided or file does not exist"
    exit 1
fi

# Use awk to process the data file, calculate averages, and print a formatted report
awk -F'\t' 'BEGIN {
    hp_sum = 0       # Sum of HP values
    attack_sum = 0   # Sum of Attack values
    count = 0        # Count of Pokémon entries
}

{
    if (NR > 1) {  # Skip the header row
        hp_sum += $6    # Add HP value from column 6
        attack_sum += $7  # Add Attack value from column 7
        count++          # Increment Pokémon count
    }
}

END {
    file_name=ARGV[1]  # Store the file name from arguments
    print "===== SUMMARY OF DATA FILE ====="
    print ""
    print "   File name: " file_name
    print ""
    print "   Total Pokemon: " count
    print ""
    print "   Avg. HP: " (hp_sum / count)  # Calculate average HP
    print ""
    print "   Avg. Attack: " (attack_sum / count)  # Calculate average Attack
    print ""
    print "===== END SUMMARY ====="
}' "$1"

