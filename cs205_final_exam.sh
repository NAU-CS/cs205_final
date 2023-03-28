#!/bin/sh
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

##########################################################################
#edit of file starting here 
#set varriable file as the path of pokemon.dat, can be changed for other files/filepaths
FILE="/home/regen/cs205_final/pokemon.dat"

#print the header of the output text 
echo "===== SUMMARY OF DATA FILE ====="

#prints the name of the file, making sure not to print whole path
find $FILE -type f -printf "   File name: %f "

#prints an extra row as the previous line doesnt like to indent
echo " "

#prints the total pokemon, line-1 is there to account for the header of the pokemon.dat file, as the output should be 800 pokemon. also sets it as the varriable tp so when HP and attack are always devided by the correct amount
tp= awk 'BEGIN{line=-1}{line++} END{print "   Total Pokemon: ",line}' $FILE

#finds the sum of colum 6 which is HP and devides it by total pokemon(tp) and then printst that varriable 
awk 'BEGIN{}{sum+=6} END{print "   Avg. HP: ", sum/$tp}' $FILE

#finds the sum of colum 7 which is Attack and devides it by total pokemon(tp) and then printst that varriable 
awk 'BEGIN{}{sum+=7} END{print "   Avg. Attack: ", sum/$tp}' $FILE

#prints footer of the output text
echo "===== END SUMMARY ====="
