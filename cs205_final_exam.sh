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



# print title
echo "===== SUMMARY OF DATA FILE ====="

# print the file name
echo "    File name: pokemon.dat"

# print the total pokemon
echo "    Total Pokemon: "

# print the average of the total pokemon
awk 'BEGIN{ counter = -1 } { sum = sum + $2; counter = counter + 1}END {print counter}' pokemon.dat

# print average HP
echo "    Avg. HP: "

# print the average of pokemon HP
awk 'BEGIN{ sum = 0; counter = -1} {sum = sum + $4; counter = counter +1}END {print sum/counter}' pokemon.dat

# print average attack
echo "    Avg. Attack: "

# print the average of pokemon attack
awk 'BEGIN{ sum = 0; counter = -1} {sum = sum + $5; counter = counter +1}END {print sum/counter}' pokemon.dat

#print the end summary
echo " ===== END SUMMARY ====="

