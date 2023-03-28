#! /usr/bin/awk -f
#This is the shebang that specifies what the interpreter is

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

BEGIN{count = 0}
#This begins the script and sets a variable count to zero
{count++}
#This adds one to the value of count for each line of the file
{HP = HP + $6}
#This defines a variable HP as what is was before plus the value in the sixth column of the file
{ATK = ATK + $7}
#This defines a variable ATK as the value it was before plus the value of the seventh line of the file
END{
#This tells the awk script what to do when it is done going through every line
	print "===== SUMMARY OF DATA FILE ====="
#This prints the first line
	print "   File name: " FILENAME
#This prints the second line with the file name variable at the end 
	print "   Total Pokemon: " count
#This prints the third line with the count variable at the end
	print "   Avg. HP: " HP/count
#This prints the fourth line with the HP variable divided by the count variable at the end to find the mean HP
	print "   Avg. Attack:  " ATK/count
#This prints the fifth line with the ATK variable divided by the count variable at the end to display the mean attack damage
	print "===== END SUMMARY ====="
#This prints the sixth line
}
