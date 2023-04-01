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

# bjs397's comments
# declare positional paramter of data file as the first position
FILE=${1}

# echo the first two lines of the summary: the summary line and the
# line that calls $FILE which will return the data file name passed
# in the first positional parameter
echo "===== SUMMARY OF DATA FILE ====="
echo "    File name: $FILE"

# make our first call to awk, where we will count how many pokemon 
# are in the file. We subtract 1 from the sum because we don't want to 
# count the column name line as a pokemone line.
awk 'BEGIN{ sum = 0 } 
     //{ sum++ } END{ print "    Total Pokemon:", sum-1 }' $FILE

# make our second call to awk, where we will calculate the average
# of the pokemon's HP. We begin by assigning the sixth position (HP column)
# to our hp variable. We then sum all the variables from this column.
# Then we print out our desired average, being careful to divide by
# (NR-1) which is "number of records" minus 1 (again due to the first line
# not being a pokemon line).
awk 'BEGIN{ hp = 0 }
     //{ hp+=$6 } END{ print "    Avg. HP:", hp/( NR-1 ) }' $FILE

# make our final awk call, where we will calculate the average
# of the pokemon's attack. We assign the seventh position (attack column)
# to our attack variable and we sum all the variables from this column 
# using the += operator. Then we print out our desired average, being
# careful to divide by (NR-1) again.
awk 'BEGIN{ attack = 0 }
     //{ attack +=$7 } END{ print "    Avg. Attack:", attack/(NR-1) }' $FILE

# make our final echo call to complete the summary print
echo "===== END SUMMARY ====="
