# TODO: Modify this file to create a shell script that is able to use awk to go 
#  through a file formatted like best_pokemon.dat and provides a printed report 
#  in the following format (where your script correctly calculates the values 
#  that go into the [VALUE] placeholders):
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
#  necessarily be called best_pokemon.dat. However, you can assume that any file 
#  passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
#!/bin/bash
# get file name from argument
FILENAME="$1"
# get total number of pokemon
TOTAL_POKEMON=`cat $1 | awk 'END {print NR}'`
# get average hp using cat/awk (column 4)
AVG_HP=`cat $1 | awk '{AVG_HP+=$4/NF} END {print AVG_HP}'`
# get average attack using cat/awk (column 5)
AVG_ATTACK=`cat $1 | awk '{AVG_ATTACK+=$5/NF} END {print AVG_ATTACK}'`
# display title
echo "===== SUMMARY OF DATA FILE ====="
# display file name
echo "   File name:" $1
# display number of pokemon
echo "   Total Pokemon:" $TOTAL_POKEMON
# display average hp
echo "   Avg. HP:" $AVG_HP
# display agerage attack
echo "   Avg. Attack:" $AVG_ATTACK
# display end of summary
echo "===== END SUMMARY ====="