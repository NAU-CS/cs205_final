#!/usr/bin/awk -f
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

#seperate the data file by tabs, and initalize the variables 
BEGIN{FS="\t";hp = 0;total=0;attack=0
#print the summary header
print" ===== SUMMARY OF DATA FILE ====="
#print the file name 
print" File name: pokemon.dat"}
#add to the count of total pokemon
{total+=1}
#add up the hp column
{hp+=$6}
#add up the attack column
{attack+=$7}
#display the total number of pokemon and subtract one row 
END{print " Total Pokemon: " total -1
#display the avg. hp by dividing by the total hp by the number of rows minus 1
print " Avg. HP: " hp /(NR-1) 
#display the avg. attack by dividing the total attack by the number of rows minus 1
print " Avg. Attack " attack /(NR-1)
#display the summary footer
print "===== END SUMMARY ====="}

