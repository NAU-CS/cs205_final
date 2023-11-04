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

#Set the passing variable to the file name
FILE=$1
#Set the total to zero
TOTAL=0
#Set the HP to zero
HP=0
#Set the attack to zer 
ATTACK=0

#Open the file
$FILE

#While reading to the end of the file, store the fifth and sixth column (HP and attack)
while IFS= read -r col5 col6
do
#Increment the total by one
TOTAL=$TOTAL+1
#Increment the hp by the hp read
HP=$HP+$col5
#Increment the attack by the attack read
ATTACK=$ATTACK+$col6
#Finish the while statment 
done < $FILE 

#Print out the information 
echo "===== SUMMARY OF DATA FILE ======"
#Print out the file name 
echo "    File name: " $FILE
#Print out the line count 
echo "    Total Pokemon: " wc -l $FILE
#Print out the hp 
echo "    Avg. HP: " $HP
#Print out the attack 
echo "   Avg. Attack: " $ATTACK
echo " ===== END SUMMARY ====="
