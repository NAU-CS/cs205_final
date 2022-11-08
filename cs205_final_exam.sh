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

# Assign Variables
var=totalPokemon
var=aveHP
var=aveAtk

# Get number of lines in file, assign to totalPokemon
totalPokemon=$(wc -l < $1)
# One line is the header, so decrease value by 1.
totalPokemon=$((totalPokemon-1))

# Average up all values in column 5 for average HP
aveHP=$(awk '{total+= $5 } END { print total/NR}' $1)

# Average all values in column 6 for average attack
aveAtk=$(awk '{total+= $6 } END { print total/NR}' $1)

echo "===== SUMMARY OF DATA FILE ====="
echo "    File name: $1"
echo "    Total Pokemon: $totalPokemon"
echo "    Avg. HP: $aveHP"
echo "    Avg. Attack: $aveAtk"
