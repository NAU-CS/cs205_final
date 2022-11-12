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

#This line prints the words SUMMARY OF DATA FILE to screen
echo ===== SUMMARY OF DATA FILE =====

#This line prints the first argument to the screen
echo    File name: $1

#This line prints out the number of lines -1 to the screen, which in this case is the number of pokemon in the file 
awk 'END{print "Total Pokemon: "NR-1}' $1

#This line calculates the Average HP by summing up all the values in column 6, and then dividing it by the number of lines -1
awk 'BEGIN{FS="\t"; sum=0} {sum+=$6} 
END{print "Avg. HP: "sum / (NR-1)}' $1

#This line calculates the average attack of each pokemon using similar methods
awk 'BEGIN{FS="\t"; sum=0} {sum+=$7}
END{print "Avg. Attack: "sum/(NR-1)}' $1

#This line prints the words END SUMMARY to screen
echo ===== END SUMMARY =====

