#!/bin/awk -f

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
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is forma



BEGIN{
	lines = -1 # need a bias
	hp = 0 # set hp equal to zero
	atk = 0 # set attack equal to zero
	name_of_file = $(basename "$0")
}
{
lines++;
#check if a number is present at line 5
if ($5 % 2 == 0 || $5 % 2 == 1) 
{
#add to the hp
hp += $5
#add to the attack in the sixth row
atk += $6
}
#checking to see if a number is present at line 6
else if ($6 % 2 == 0 || $6 % 2 == 1) 
{
#add to the hp
hp += $6
#add to the attack in the seventh row
atk += $7
}
#ckeck to see if a number is present at line 7
else if ($7 % 2 == 0 || $7 % 2 == 1) 
{
#add to the hp
hp += $7
#add to the attack in the seventh row
atk += $8
}

}
END{
#calculate avrage hp and attack
hp = hp/ lines
atk = atk / lines

#echo the output
print "===== SUMMARY OF DATA FILE ====="
print "   File name:" name_of_file
print "   Total Pokemon:" lines
print "   Avg. HP:" hp
print "   Avg. Attack:" atk
print "===== END SUMMARY ====="



}























