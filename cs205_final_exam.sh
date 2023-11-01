# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

#!/bin/bash

# This line initializes variables to be used to collect data from file
BEGIN {FS"\t"; total_pokemon=0; health_points=0; attack=0; FILE=$1}
	# This body adds the sum of HP and attack
	{health_points+=$6; attack+=$7}
# This line processes data and displays result in the specified format
END {print "===== SUMMARY OF DATA FILE =====";
	print "   File name: " ARGV[1];
	print "   Total Pokemon: " NR;
	print "   Avg. HP: " health_points/NR;
	print "   Avg. Attack: " attack/NR;
	print "===== END SUMMARY ====="}
