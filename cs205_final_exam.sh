#!/bin/bash
# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====
BEGIN{{FS="\t"}}
# gets the sum of all HP
{(sum += $6)}
#gets the sume of all Attack
{(att += $7)}
# gets the Number of lines for average calculation
{NR}
# prints out all the data
END{print "File name: "ARGV[1], "\nTotal Pokemon: ", NR-1, "\nAvg. HP: ",sum/(NR-1), "\nAvg. Attack: " att/(NR-1)}


# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

