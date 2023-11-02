# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

#$1 is the variable for the filename passed through the executable line. For example, if I run a command "$prog1.sh prog2.dat" $1 will have the value "prog2.dat" in it.
FILE="$1"
#To find the total pokemon, we cannot simply use the largest number in column 1 since there are repeated pokemon in the calculations for attack and hp, so we find the amount of newlines -1 to acount for the header.
TOTAL=$(awk 'BEGIN {max = 0} NR > max {max = NR} END {print max-1}' $FILE)
#To find the HP, we need to tell awk that the deliniator between columns is a tab ("\t"). Then we add up all the hp, which is column 5, and divide it by the total number of pokemon. 
HP=$(awk 'BEGIN {FS = "\t"} {hp += $5} END {print hp/$TOTAL}' $FILE)
#Similarly, to find average HP we note that the deliniator is a tab, add up all the attack, which is column 6, and then divide it by the total number of pokemon.
ATK=$(awk 'BEGIN {FS = "\t"} {atk += $6} END {print atk/$TOTAL}' $FILE)

#This echos the format exactly shown in the example.
echo "==== SUMMARY OF DATA FILE ===="
echo "    File name: $FILE"
echo "    Total Pokemon: $TOTAL"
echo "    Avg. HP: $HP"
echo "    Avg. Attack: $ATK"
echo "===== END SUMMARY ====="

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
