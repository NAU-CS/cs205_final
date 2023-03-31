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

# initialize file name and make it so that the file name entered after the run file works
FILE=$(awk 'FNR == 1{print FILENAME}' $1)

# initialize variable for total number of pokemon
TOTAL=0

# initialize variable for the average health of the pokemon
HEALTH=0

# initialize variable for the average attack of the pokemon
ATTK=0

# create the title
echo "===== SUMMARY OF DATA FILE ====="

# print the file name that we will collect data from
echo "File name: $FILE"

# calculate the total amount of pokemon in the file using awk
# do this by adding every line, but subtract by one t take into account the header
# also add $FILE at the end to allow it access data
total_poke=$(awk '{FS="\t"}{TOTAL+=1}END{print "Total Pokemon: "TOTAL-1}' $FILE)
# echo the result
echo "$total_poke"

# calculate the average of the health of the pokemon by adding the HP column together (#6)
# added the "\t" to take into account that the columns are unaligned
# then divide by the number of lines to find average
# add $FILE to allow access
avg_HP=$(awk '{FS="\t"}{HEALTH+=$6}END{print "Avg. HP: "HEALTH/NR}' $FILE)
# echo result
echo "$avg_HP"

# calculate the average of the attacks that the pokemon can do by adding the entire attack column (#7)
# also added the "\t" to take into account that the columns are unaligned
# divide by the number of lines
# add $FILE to allow access
avg_attk=$(awk '{FS="\t"}{ATTK+=$7}END{print "Avg. Attack: "ATTK/NR}' $FILE)
# echo the result
echo "$avg_attk"

# end the program by printing the end message
echo "===== END SUMMARY ====="
