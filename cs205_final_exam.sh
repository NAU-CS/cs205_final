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

#The following line prints the header.
awk 'END{ print "===== SUMMARY OF DATA FILE =====" }' $1

#The following line prints out the FILENAME variable, which houses the name of the file which has been opened by awk.
awk 'END{ print "   File name: ", FILENAME }' $1

#The following line prints out the NR variable, which houses the number of lines that awk processes. The ' - 1' after NR is to compensate for the header in pokemon.dat
awk 'END{ print "   Total Pokemon: ", NR - 1 }' $1

#The following line establishes the variable x at 0. Each new line, it looks at the sixth column (the health column) and adds that number to variable x. after it is done, the variable n is created which holds the number of lines excluding the header. It then prints out the total HP (x) divided by the number of pokemon (n) 
awk 'BEGIN{x = 0 } { x = x + $6} END {n = NR - 1 ; print "   Avg. HP: ", x / n }' $1

#The following line does the exact same thing as the one before, but for the seventh column (the attack column)
awk 'BEGIN{x = 0 } { x = x + $7} END {n = NR - 1 ; print "   Avg. Attack: ", x / n }' $1

#The following line prints the footer.
awk 'END{ print "===== END SUMMARY =====" }' $1
