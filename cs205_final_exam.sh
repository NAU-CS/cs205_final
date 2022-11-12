# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#Prints the filename using the FILENAME variable
END {print "File Name: \t" FILENAME}

#    Total Pokemon: [VALUE] 
#Finds the total number of lines in a file which would find the total pokemon
{total = FNR}

#Prints the total amount of pokemon
END {print "Total Pokemon: \t" total}


#    Avg. HP: [VALUE]
#Finds the value of the total HP of all the pokemon
{total_HP += $5}

#Prints the Avg. HP of the pokemon
END {print "Avg. HP: \t" total_HP/total}

#    Avg. Attack: [VALUE]
#Finds the value of the total Attack value of all the pokemon
{total_Attack += $6}

#Prints the Avg. Attack of the pokemon
END {print "Avg. Attack: \t" total_Attack/total}

# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
