# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

#display file name
echo "File name: pokemon.dat"

#display total pokemon
echo "Total Pokemon: $POKES"

#get pokemon amount
POKES = wc - 1 < pokemon.dat

#display average HP
echo "Avg. HP: $HP"

#intialize sum
SUM = 0
#add HP to sum
SUM += $6 
#get average 
HP = SUM / POKES

#display avaergae attack
echo "Avg. Attack: $ATTACK"

#initialize total
TOT = 0
#add attack value to total
TOT += $7
#get average
ATTACK = TOT / POKES

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
