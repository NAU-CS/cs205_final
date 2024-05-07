# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====
#!/bin/bash

# This script summarizes data from a given Pokemon data file formatted like best_pokemon.dat.
# It assumes the file uses tabs as column separators and that HP is in the sixth column and Attack is in the seventh column.

# Check if the file name has been provided as a positional parameter
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

# Use awk to process the file and calculate the required statistics
{
    echo "# ===== SUMMARY OF DATA FILE ====="
    echo "#    File name: $filename"
    # Count total Pokemon (excluding the header line) and calculate average HP and average Attack
    awk 'BEGIN {
        FS="\t"       # Set field separator to tab
        total=0       # Initialize total number of Pokemon
        sum_hp=0      # Initialize sum of HP
        sum_attack=0  # Initialize sum of Attack
    }
    NR>1 {            # Skip header line
        sum_hp += $6  # Sum HP values
        sum_attack += $7  # Sum Attack values
        total++      # Increment total count
    }
    END {
        if (total > 0) {
            avg_hp = sum_hp / total     # Calculate average HP
            avg_attack = sum_attack / total  # Calculate average Attack
        } else {
            avg_hp = 0
            avg_attack = 0
        }
        printf "#    Total Pokemon: %d\n", total
        printf "#    Avg. HP: %.2f\n", avg_hp
        printf "#    Avg. Attack: %.2f\n", avg_attack
    }' "$filename"
    echo "# ===== END SUMMARY ====="
} > report.txt

# Print the report
cat report.txt
# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
