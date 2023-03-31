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


#This line finds the sum of all values in a column, based on [VALUE], and prints the mean of them for any file ($FILE)
#RESULT=awk '{sum+=$[VALUE]; next} END{print sum/NR}' pokemon.dat

#print values 
#heading
echo "====SUMMARY OF DATA FILE===="
#file name
echo "File name: pokemon.dat"
#get total pokemon
echo "Total Pokemon: "awk '{sum+=$1; next} END{print sum}' pokemon.dat
#get avg hp
echo "Avg. HP: " awk '{sum+=$5; next} END{print sum/NR}' pokemon.dat
#get avg attack
echo "Avg. Attatck: " awk '{sum+=$6; next} END{print sum/NR}' pokemon.dat
#ending 
echo "===== END SUMMARY ====="
