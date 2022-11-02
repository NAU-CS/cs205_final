#! /usr/bin/awk -f

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

BEGIN {
# Get the name of the input file
filename = ARGV[1]
}

{
# Adds the HP (sixth column) of each row to a sum, and counts each line. Starts on second line of file (first pokemon)
if (NR > 1) HPsum += $6

# Adds the ATT rating (seventh column) of each row to a sum, and counts each line. Starts on second line of file (first pokemon)
if (NR > 1) ATTsum += $7

# Finds the number of pokemon by counting each line after the initial line.
numPokemon = NR -1
}

END {
 # Prints the number of pokemon, the average HP, and the average ATT values
 # by dividing their sums by the total number of pokemon (number of lines - 1)
 print "===== SUMMARY OF DATA FILE ====="
 print "   File name: ", filename
 print "   Total Pokemon: ", numPokemon
 print "   Avg. Attack: ", ATTsum / numPokemon
 print "   Avg. HP: ", HPsum / numPokemon
 print "===== END SUMMARY ====="
}
