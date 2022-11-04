#!/usr/bin/awk
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

# echo the title 
echo ' ==== SUMMARY OF DATA FILE ==== '
# echo the file name
echo 'File name: pokemon.dat' 
# loop through the file and count the amount of pokemon
# print the total pokemon
awk 'BEGIN{i=0}{i++;}END{print "Total Pokemon: ", i}'
# loop through the file and calculate the average HP
# print the average HP of all pokemon
awk 'BEGIN{total=0;counting=0}{total=total+$6;counting=counting+1}END{print "Avg. HP: ", total/counting}'
# loop through the file and calculate average attack of pokemon
# print the average attack  of the all pokemon
awk 'BEGIN{totaling=0;count=0}{totaling=total+$7;count=count+1}END{print "Avg. Attack: ", totaling/count}'
# print the end title
echo ' ==== END SUMMARY ==== ' 
