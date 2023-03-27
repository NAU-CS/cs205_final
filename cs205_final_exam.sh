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

{hp+=$6; attack+=$7} END {                #sums up line 6 for the HP values, and line 7 for the attack values
print "===== SUMMARY OF DATA FILE ====="; #starts the formatting
print "    File name: " FILENAME;         #prints the file name
print "    Total Pokemon: " NR-1;         #lists the amount of pokemon by taking the total number of rows minus one due to the formatting in pokemon.dat 
print "    Avg. HP: " hp/(NR-1);          #takes the sum given by hp and divides it by the number of rows minus the first formatting row
print "    Avg. Attack: " attack/(NR-1);  #same as previous line
print "===== END SUMMARY =====";         #finishes the formatting
}
