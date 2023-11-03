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

# Check if a file is provided as a positional parameter
if [ $# -ne 1 ]; then
  echo "Usage: $0 <data_file>"
  exit 1
fi

# Extract the file name from the provided data file path
data_file="$1"
file_name=$(basename "$data_file")

# Use awk to calculate the mean values
summary=$(awk '
  BEGIN {
    # Initialize variables to calculate the mean values
    total_pokemon = 0
    total_hp = 0
    total_attack = 0
  }
  # Process each line of the data file
  {
    total_pokemon++
    total_hp += $4
    total_attack += $5
  }
  # Calculate the average values
  END {
    avg_hp = total_hp / total_pokemon
    avg_attack = total_attack / total_pokemon
    # Print the summary report
    printf("===== SUMMARY OF DATA FILE =====\n")
    printf("   File name: %s\n", file_name)
    printf("   Total Pokemon: %d\n", total_pokemon)
    printf("   Avg. HP: %.2f\n", avg_hp)
    printf("   Avg. Attack: %.2f\n", avg_attack)
    printf("===== END SUMMARY =====\n")
  }
' file_name="$file_name" "$data_file")

# Print the summary report
echo "$summary"

