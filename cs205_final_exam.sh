# TODO: Modify this file to create a shell script that is able to use awk to go
#through a file formatted like pokemon.dat and provides a printed report in the
#following format (where your script correctly calculates the values that go into
#the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script.
# The data file will be passed in to the script as a positional parameter and will not
#necessarily be called pokemon.dat. However, you can assume that any file passed to this
#script will be formatted exactly the way pokemon.dat is formatted.


#Read in a positional argument and store it in a variable named FILE: DONE
FILE=$1
# set variable NUMPOKEMON equal to the number of lines (and pokemon) in the file (I know that there are duplicates (like
# charizard), but each entry has different stats so I'm counting them as seperate)
NUMPOKEMON=$(wc -l < $FILE)
#set AVGHP to the total sum of the 4th column (hp) and divides it by the number of lines
AVGHP=$(awk '{ totalhp += $4 } END { print totalhp/NR }' $FILE)
#set AVGATTACK to the total sum of the 5th column (attack) and divides it by the number of lines
AVGATTACK=$(awk '{ totalattack += $5 } END { print totalattack/NR }' $FILE)
#print report as formatted
echo "===== SUMMARY OF DATA FILE ====="
echo "    File name: $FILE
    Total Pokemon: $NUMPOKEMON
    Avg. HP: $AVGHP
    Avg. Attack: $AVGATTACK
 ===== END SUMMARY ====="
