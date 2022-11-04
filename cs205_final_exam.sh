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

#!/bin/bash

# find the file name
FILE=$1

awk  'BEGIN {

lines = 0;
hpTotal = 0;
attactTotal = 0;
FS =  "\t";
}

{
lines++;
if (lines > 1 )
	{
	hpTotal += $6;
	attactTotal += $7;
	}
}

END {
lines --;
hpAverage = hpTotal / lines;
attackAverage = attactTotal / lines;

print "===== SUMMARY OF DATA FILE ====="
print "   File Name: " $ARGC;
print "   Total Pokemon: " lines;
print "   Avg. Hp :  " hpAverage;
print "   Avg. Attack: " attackAverage;
}'
