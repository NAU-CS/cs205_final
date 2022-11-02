#!/bin/bash

# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

#assigns the filename
FILE=$1
#prints the file name
echo "File name: $FILE"

#find total number of lines
echo -n "Total Pokemon: " 
awk 'END {print NR}' $FILE

#Calculate the average HP
echo -n "Avg. HP: "
awk '{ sum += $5 } END { if (NR > 0) print sum / NR }' $FILE

#Calculate the averahe Attack
echo -n "Avg. Attack: "
awk '{ sum += $6 } END { if (NR > 0) print sum / NR }' $FILE
