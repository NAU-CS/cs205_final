#!/bin/bash

#Evan Paddock, ekp68

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
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted

#The $1 is the first input value. In this case, it would be referred to as "pokemon.dat"

NAME=$1;

#Prints out the number of pokemon. Have to minus 1 to remove the top line that contains a brief description of each column. "NR" represents the number of lines in a file.
TOTAL=` awk 'END{print NR - 1};' $1`;

#The FS is the field separator which is set to tabs (\t). The HP is in the 6th column while the ATTACK is in the 7th. To do the average, I set sum equal to 0 first and then use "sum += $#"to add each value in the specified column. After it has finished, I then divid it by the number of pokemon there is with "NR - 1".
HP=` awk '
BEGIN{FS="\t"}
BEGIN{
	sum = 0
}
{
	sum += $6
}
END {if (NR -1 > 0) print sum / (NR - 1)}
' $1`;
ATK=` awk '
BEGIN{FS="\t"}
BEGIN{
	sum = 0
}
{
	sum += $7
}
END {if (NR -1 > 0) print sum / (NR - 1)}

' $1`;

#Results are printed
echo "
===== SUMMARY OF DATA FILE =====
	File name: $NAME
	Total Pokemon: $TOTAL
	Avg. HP: $HP
	Avg. Attack: $ATK
===== END SUMMARY =====
"
