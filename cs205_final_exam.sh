# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.

#!/bin/bash

file="best_pokemon.dat"
total=$(awk 'END{print NR}' $file)
avg_hp=$(awk '{sum+=6} END{print sum/NR}' $file)
avg_atk=$(awk '{sum+=$7 END{print sum/NR}' $file)

echo "===== SUMMARY OF DATA FILE ====="
echo "File name: [VALUE]"
echo "Total Pokemon: [VALUE]"
echo "Avg. HP: [VALUE]"
echo "Avg. Attack: [VALUE]"
echo "===== END SUMMARY ====="
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
k
