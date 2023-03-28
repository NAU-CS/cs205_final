#! /usr/bin/awk -f
# Shebang to be able to use awk interpreter
# start the script and initialize the line count
BEGIN{count = 0}
# for each line in file add 1 to count 
{count++}
# find the sum of the HP column by adding the stored value in column 6 to the previous running sum
{HP_SUM = HP_SUM + $6}
# find the sum of the atk column by adding the stored value in column 7 to the previous running sum
{ATTACK_SUM = ATTACK_SUM + $7}
# when we are done reading the file do the following:
END{
	# print the top of result table
	print "===== SUMMARY OF DATA FILE ====="
	# display the filename
	print "   File name: " FILENAME
	# display total pokemon result
	print "   Total Pokemon: " count
	# display average hp result
	print "   Avg. HP: " HP_SUM/count
	# display average attack result
	print "   Avg. Attack: " ATTACK_SUM/count
	# print the bottom of result table
	print "===== END SUMMARY ====="
}

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
# store the filename in a variable to clean up code

