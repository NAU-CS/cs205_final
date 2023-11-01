# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
FILE=$1 #create a variable for the filename
TOTAL=$(awk -F ' ' 'END{print $1}' $FILE) #find the last number in the first column with awk
AVGHP=$(awk -F ' ' '{sum += $6}END{print sum/NR}' $FILE) #find the average of the HP column
AVGATK=$(awk -F ' ' '{newsum += $7}END{print newsum/NR}' $FILE) #find the average of the attack column
echo "===== SUMMARY OF DATA FILE =====" #print the header
echo "   File name: $FILE" #print the filename
echo "   Total Pokemon: $TOTAL" #print the total variable
echo "   Avg. HP: $AVGHP" #print the AVGHP variable
echo "   Avg. Attack: $AVGATK" #print the AVGATK variable
echo "===== END SUMMARY =====" #print the closing message
