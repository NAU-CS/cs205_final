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

#print opening line of summary
awk 'END {print " ===== SUMMARY OF DATA FILE ====="}' $1

#print file name
awk 'END {printf"    File name: "
          print FILENAME }' $1
          
#print total number of rows - 1, to exclude header row
awk 'END {printf "    Total Pokemon: " 
          print (FNR-1)}' $1\
          
#print average of HP column
awk '{totalHP += $6} 
     END {printf "    Avg. HP: "
          print (totalHP/(FNR-1))}' $1
          
#print average of attack column
awk '{totalATK += $7} 
     END {printf "    Avg. Attack: "
          print (totalATK/(FNR-1))}' $1

#print ending line
awk 'END {print " ===== END SUMMARY ====="}' $1
