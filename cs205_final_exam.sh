# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====
#variables of value for each place to be filled
#name of the file is
filename='pokemon.dat'
#number of lines is the number of pokemon
totalPoke='$lines'
#all values of $6 added up and divided by number of lines
HP=$(awk 'BEGIN {sum += $6/$lines} END {print sum } ' pokemon.dat)
#all values of $7 added up and divided by the number of lines
ATTACK=$(awk 'BEGIN {attackSum += $7/$lines} END {print attackSum} ' pokemon.dat )
 ===== SUMMARY OF DATA FILE =====
    File name: [echo "$filename"]
    Total Pokemon: [echo "$totalPoke"]
    Avg. HP: [echo "$HP"]
    Avg. Attack: [echo "$ATTACK"]
 ===== END SUMMARY =====
# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
