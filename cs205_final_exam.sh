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

#!bin/bash

FILE=$1 #positional arg for the file
awk 'BEGIN{FS="\t"}'
echo "===== SUMMARY OF THE DATA FILE ====="
echo "    File name: [$FILE]" #print name of the input file

#total pokemon: 
total=`awk -F "\t" '{if (NR!=1) tot += 1}END{if (NR>0) print tot}' $FILE` #sum number of lines except the first. store this value, 'tot' in a temp file to be read by the shell script
echo "    Total Pokemon: [$total]"

#avg HP:
avgHP=`awk -F "\t" '{if (NR!=1) sum += $6}END{if (NR>0) print sum/NR}' $FILE` #calculate the average value of column 6, where the HP data is held
echo "    Avg. HP: [$avgHP]"

#avg attack:
avgAttack=`awk -F "\t" '{if (NR!=1) sum += $7}END{if (NR>0) print sum/NR}' $FILE` #same as avgHP, but with column 7, which has the Attack score for each pokemon
echo "   Avg. Attack: [$avgAttack]"
echo "===== END SUMMARY ====="

