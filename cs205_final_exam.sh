#!/bin/bash

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


#Assigning a value for the arguement
FILE=$1

#Initializing
SUM=0
ATTACK=0
TOTAL=-1

#Reading file
while read x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13; do
	(( ++TOTAL ))
	if [[ "$TOTAL" == '0' ]]; then
		continue
	fi
	SUM=$((SUM+$x5))
	ATTACK=$((ATTACK+$x6))
done<$FILE

#Computations
SUM=$((SUM/TOTAL))
ATTACK=$((ATTACK/TOTAL))

#Outputing to console
echo ===== SUMMARY OF DATA FILE =====
echo "      File name: $1"
echo "      Total Pokemon: $TOTAL "
echo "      Avg. HP: $SUM "
echo "      Avg. Attack: $ATTACK "
echo ===== END SUMMARY =====
