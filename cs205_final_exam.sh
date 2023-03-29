

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

#this will start the script and set the variable count equal to 0; beginning at 0
BEGIN{count = 0}
#this will add a value of 1 to count for each line 
{count++}
#this will define HP as a variable equal to its current state plus the value of the sixth column
{HP = HP + $6}
#this will define ATK as a variable equal to its current state plus the value of the seventh column
{ATK = ATK + $7}
#this will determine the final line of what AWK is to finish print
END{
#this will print the title
	print " ===== SUMMARY OF DATA FILE ===== "
#this will print the file name to be read
	print "    File name: " FILENAME
# this will print the total number of pokemon
	print "    Total Pokemon: " count
#this will print the average health each pokemon has
	print "    Avg. HP: " HP/count
#this will print the average damage each pokemon will do with each attack
	print "    Avg. Attack: " ATK/count
#this will print the end line of the file
	print " ===== END SUMMARY ===== "
}

