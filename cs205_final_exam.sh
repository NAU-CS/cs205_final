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

# get file name from first argument
FILE=$1

# print title
echo "==== SUMMARY OF DATA FILE ===="
# print file name
echo "   File name: "$FILE
# calculate and print total pokemon including megas
awk 'BEGIN {FS="\t"}; END {printf("   Total Pokemon: %d\n", FNR-1)}' $FILE
# calculate and print average hp
awk 'BEGIN {FS="\t"}; {totalHP=totalHP+$6}; END {printf("   Avg. HP: %f\n", totalHP/(FNR-1))}' $FILE
# calculate and print averate attack
awk 'BEGIN {FS="\t"}; {totalAtt=totalAtt+$7}; END {printf("   Avg. Attack: %f\n", totalAtt/(FNR-1))}' $FILE
# print end message
echo '==== END SUMMARY ===='
