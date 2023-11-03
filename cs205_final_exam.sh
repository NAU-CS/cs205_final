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

#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

# Input file provided as command-line argument
input_file="$1"

# Use awk to process the input file and generate the report
awk 'BEGIN {
    total_hp = 0
    total_attack = 0
    total_defense = 0
    total_speed = 0
    total_count = 0
}

# Process each line in the input file
{
    # Assuming the format of each line in the input file is: name,hp,attack,defense,speed
    name = $1
    hp = $2
    attack = $3
    defense = $4
    speed = $5

    # Calculate cumulative totals
    total_hp += hp
    total_attack += attack
    total_defense += defense
    total_speed += speed
    total_count++
}

# END block to calculate averages and print the report
END {
    # Calculate averages
    avg_hp = total_hp / total_count
    avg_attack = total_attack / total_count
    avg_defense = total_defense / total_count
    avg_speed = total_speed / total_count

    # Print the report
    printf("Total Pokemon: %d\n", total_count)
    printf("Average HP: %.2f\n", avg_hp)
    printf("Average Attack: %.2f\n", avg_attack)
    printf("Average Defense: %.2f\n", avg_defense)
    printf("Average Speed: %.2f\n", avg_speed)
}' "$input_file"
