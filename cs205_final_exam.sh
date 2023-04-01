# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====
#!/bin/bash

# input
file="pokemon.dat"

# Use awk to process 
result=$(awk -F "\t" '
  BEGIN {
    total_pokemon = 0
    total_hp = 0
    total_attack = 0
  }

  # Skip row 1
  NR > 1 {
    total_pokemon++
    total_hp += $6
    total_attack += $7
  }

  END {
    avg_hp = total_hp / total_pokemon
    avg_attack = total_attack / total_pokemon

    # Print the summary
    printf("===== SUMMARY OF DATA FILE =====\n")
    printf("   File name: %s\n", FILENAME)
    printf("   Total Pokemon: %d\n", total_pokemon)
    printf("   Avg. HP: %.2f\n", avg_hp)
    printf("   Avg. Attack: %.2f\n", avg_attack)
    printf("===== END SUMMARY =====\n")
  }
' $file)

# Print the result
echo "$result"

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
