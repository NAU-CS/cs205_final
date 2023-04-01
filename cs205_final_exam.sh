# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====
#!/bin/bash

filename="pokemon.dat"

# Use awk to extract required data
data=$(awk 'BEGIN{ FS = ","; OFS = ","; total=0; hp_total=0; attack_total=0;} NR>1 {total++; hp_total+=$4; attack_total+=$5;} END {print total, hp_total/total, attack_total/total;}' $filename)

# Parse the data into separate variables
total=$(echo $data | cut -d ',' -f 1)
avg_hp=$(echo $data | cut -d ',' -f 2)
avg_attack=$(echo $data | cut -d ',' -f 3)

# Print the report
printf "===== SUMMARY OF DATA FILE =====\n"
printf "    File name: %s\n" "$filename\n"
printf "    Total Pokemon: %d\n" "$total\n"
printf "    Avg. HP: %.2f\n" "$avg_hp\n"
printf "    Avg. Attack: %.2f\n" "$avg_attack\n"
printf "===== END SUMMARY =====\n"

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
