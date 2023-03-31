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
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.




BEGIN {
#init vars
average_hitpoints = 0
average_attack = 0
pokemon = -1
hitpoints = 0
attack = 0
pokefile = $(basename "$0")
}{
#add to num pokemon
pokemon = pokemon + 1

#if statemnts to add to total hitpoints
if($5 % 2 == 0 || $5 % 2 == 1) {
#add fifth row to hitpoints 
hitpoints = hitpoints + $5
#add sixth row to attack
attack = attack + $6
}
else if ($6 % 2 == 0 || $6 % 2 == 1) {
#add sixth row to hitpoints
hitpoints = hitpoints + $6
#add seveneth row to attack
attack = attack + $7
}
else
{
#add seventh row to hitpoints
hitpoints = hitpoints + $7
#add eigth row to attack
attack = attack + $8}
}
END {

average_hitpoints = hitpoints / pokemon
average_attack = attack / pokemon
print "===== SUMMARY OF DATA FILE ====="
print "File name: " pokefile
print "Total Pokemon: " pokemon
print "Avg. HP: " average_hitpoints
print "Avg. Attack: " average_attack
print "===== END SUMMARY ====="}
