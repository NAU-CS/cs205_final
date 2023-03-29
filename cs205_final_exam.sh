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

#This will begin the script by putting the starting variable count to 0
BEGIN{count - 0}
#This will be increasing the variable count in each line
{count++}
#For each line, it would be adding the number in the sixth column using variable HP
{HP = HP + $6}
#For each line, it would be adding a number in the seventh column using variable ATK
{ATK = ATK + $7}
#This will give instruction to the script once it completed going through all the lines
END{
#This is going to print the first line
	print " ===== SUMMARY OF DATA FILE ===== "
#This is going to print the second line along with the variable at the end of the file name
	print "   File name: " FILENAME
#This is going to print the third line along with the variable count at the end of the line
	print "	  Total Pokemon: " count
#This is going to print the fourth line along with the HP variable being divided by the variable count
	print "	  Avg. HP: " HP/count
#This prints the fifth line  along with the ATK variable being divided by the variable count
	print "	  Avg. Attack: " ATK/count
#This is going to print the sixth line
	print " ===== END SUMMARY ===== "
}
