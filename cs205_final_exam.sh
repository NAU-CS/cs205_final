# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon>
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.>



#!/bin/bash
# print header
printf " ===== SUMMARY OF DATA FILE ===== \n"
# print file name
printf "    File name: $1 \n"
# total first part with printf
printf "    Total Pokemon: "
# use awk to get each line
awk 'BEGIN {FS = "\t"} ; {count++} END {print count-1;} ' $1
# print first part with pritnf
printf "    Avg. HP: "
# print average hp with awk
awk 'BEGIN {FS = "\t"} ; {HPsum+=$6;} {count++} END {print HPsum/count;} ' $1
# print first part of attack
printf "    Avg. Attack: "
# print final part of average attack
awk 'BEGIN {FS = "\t"} ; {ATKsum+=$7} {count++} END {print ATKsum/count;} ' $1
# print final message
printf " ===== END SUMMARY ===== \n"


