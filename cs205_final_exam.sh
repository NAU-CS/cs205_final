#!/bin/awk -f


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


BEGIN {
    # Set variables
    number_of_pokemon = -1 # Start at -1 to ignore header line
    hp_total = 0
    atk_total = 0
    filename = $(basename "$0")
    
}

{
    number_of_pokemon++
    

    # Calculate total HP 
    #it checks if the value is a numver in the 5th row
    if ($5 % 2 == 0 || $5 % 2 == 1) {
        #adds the 5th row value to hp_total
        hp_total += $5
        # Calculate total attack
        
        #adds the 6th row value to hp_total
		atk_total += $6
        
        
           
    
    
    #else if checks 6th row 
    } else if ($6 % 2 == 0 || $6 % 2 == 1) {
        #adds the 6th row value to hp_total
        hp_total += $6
        
        
        #adds the 7th row value to hp_total
	atk_total += $7
        
            
        
        
    #else if checks 7th row
    } else {
        #adds the 7th row value to hp_total
        hp_total += $7
        
        #adds the 8th row value to hp_total
        atk_total += $8
    }

    
    
    
}

END {
    # Calculate averages
    avg_hp = hp_total / number_of_pokemon
    avg_atk = atk_total / number_of_pokemon
    # Output summary
    print "===== SUMMARY OF DATA FILE ====="
    print " File name: " filename
    print " Total Pokemon: " number_of_pokemon
    print " Avg. HP: " avg_hp
    print " Avg. Attack: " avg_atk
    print "===== END SUMMARY ====="
}
