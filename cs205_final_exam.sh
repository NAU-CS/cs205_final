#!/bin/bash

# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ======= SUMMARY OF POKEMON.DAT ======
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ======= END SUMMARY =======

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

# Go through full pokemon file
awk -F'\t' '{  
   # Increment pokemon count
   count += 1;

   # Add to total HP
   sumHP += $6;

   # Add to total Attack
   sumATK += $7;    }

# Do after everything else
END {
    # Calculate average HP
    avgHP = sumHP / NR;
    
    # Calculate average Attack
    avgATK = sumATK / NR;
    
    # Print output header
    print "======= SUMMARY OF", toupper(FILENAME), "======";

    # Print total pokemon
    print "    Total Pokemon: ", count;

    # Print average HP
    print "    Avg. HP: ", avgHP;

    # Print average Attack
    print "    Avg. Attack: ", avgATK;

    # Print output ender
    print "======= END SUMMARY =======";   }' $1

    # $1 is file passed