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

# added a header of data file start summary
END{print "===== SUMMARY OF DATA FILE ====="}

# added function to print file name
END{print "   File name: "FILENAME}

# added function to print total pokemon, which is just number of lines
END{print "   Total Pokemon: "NR}

# added function to add the total number of values in column 6, then divide that total by the pokemon total
{healthsum += $6} END{print "   Avg. HP: "healthsum/NR}

# added funciton to add the total number of values in column 7, then divide that total by the pokemon total
{attacksum += $7} END{print "   Avg. HP: "attacksum/NR}

# added a footer of data file end summary
END{print "===== END SUMMARY ====="}
