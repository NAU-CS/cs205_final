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

#!/bin/sh

#print the starting sequence
echo "===== SUMMARY OF DATA FILE ====="

#set the file parameter to a variable
thatfile="$1"
#print the filename to the terminal
echo "    File name: $thatfile"


#count the lines of the file
lines=$(wc --lines < $thatfile)
#print the number of lines to the terminal
echo "    Total Pokemon: $lines"

#find the average health points and set it to a variable
hpavg=$(awk '{ sum +=$6 } END{ print sum/NR}' $1)
#print the average health in the correct format
echo "    Avg. HP: $hpavg"

#find the average attack and set it to a variable
attkavg=$(awk '{ sum+=$7 } END{ print sum/NR}' $1)
#print the average attack  in the correct format
echo "    Avg. Attack: $attkavg"

#print the end border'
echo "===== END SUMMARY ====="
