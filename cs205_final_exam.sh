#!/bin/awk -f

#this first part just takes the entered file name and places it here
BEGIN{print "File name: " ARGV[1]}

#prints the end of the list with the total of all pokemon
END{print "Total Pokemon: " FNR}

#calculates the mean of pokemon HP
{Total+= $6} {HPmean= Total/FNR} END{print "Avg. HP: " HPmean}

#calculates the mean of pokemon attacks
{attackTotal+= $7} {attackMean= attackTotal/FNR} END{print "Avg. Attack: " attackMean} 


# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
