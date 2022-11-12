#!/bin/bash
# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The Avg. values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.


BEGIN{FS="\t";sum1=0;sum2=0} # Use BEGIN to start code; File columns are seperated by tabs; sum1 and sum2 is intialized to zero for average hp and avergae attack;
{sum1+=$6} # Add sum of 6th column
{sum2+=$7} # Add sum of 7th column
END{print "===== SUMMARY OF DATA FILE =====\n""   File name: pokemon.dat\n""   Total Pokemon: "NR "\n""   Avg. HP: "sum1/(NR-1)"\n""   Avg. Attack: "sum2/(NR-1)"\n""===== END SUMMARY =====\n"} # Print format with calculated values.


