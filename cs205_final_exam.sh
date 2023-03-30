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
# run by ./cs205_final_exam.sh [filename.dat] replacing the name after the ./ with what youve named the file and [filename.dat] with any .dat file an example: ./cs205_final_exam.sh pokemon.dat
#initialize a filename to be the first input after the run file
FILENAME=$1
#variable for the number of pokemon in the file
SUMPOKEMON=0
#variable for the total HP added up
SUMHP=0
#variable for the total ATK added up
SUMATK=0

#prints the title
echo " ===== SUMMARY OF DATA FILE ====="
#prints the filename as given
echo "    File name: $FILENAME"
#adds up all the pokemon per line
awk '{SUMPOKEMON+=1 }END{print "    Total Pokemon: "SUMPOKEMON}' $FILENAME
#adds up the 6th colomn that is the HP in the pokemon.dat file
awk '{SUMHP+=$6 }END{print "    Avg. HP: "SUMHP/NR}' $FILENAME
#adds up the 7th colomn that is the ATK in the pokemin.dat file
awk '{SUMATK+=$7 }END{print "    Avg. ATK: "SUMATK/NR}' $FILENAME
#ends the program by printing an ending line
echo " ===== END SUMMARY ====="
