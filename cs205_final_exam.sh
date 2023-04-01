#!/usr/bin/awk -f
#Shebang to be able to use the awk command and interpreter
#make the line count 0 and start script
BEGIN{count = 0}


# add 1 to count for each line in the file
{count++}
# SUm the HP values by adding the value in column 6 to previous running sum
{HP_SUM = HP_SUM + $6}
# do the same thing but for the attack column by adding to previous clm 7 sum
{ATTACK_SUM = ATTACK_SUM + $7}
# once file has read through, do the following
END{
	#print top of the table
	print "===== SUMMARY OF DATA FILE ====="
	#display name of the file
	print "   File name: " FILENAME
	#display total amount of pokemon
	print "   Total Pokemon: " count
	#show the average hp of the pokemon
	print "   Avg. HP: "HP_SUM/count
	#show the average of the attack column
	print "   Avg. Attack: " ATTACK_SUM/count
	#print the bottom of the table
	print "===== END SUMMARY ====="

}














