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
#!/bin/bash

#init variables
filename=$1 # param 1 is stored as filename

totalPokemon=0

totalHP=0
avgHP=0

totalAttack=0
avgAttack=0

# calculate total number of pokemon
totalPokemon=$(wc -l $filename | cut -d " " -f 1)

totalPokemon=$(expr $totalPokemon - 1)



# calculate average HP
totalHP=$(tail +2 pokemon.dat | awk '{
    if($5 ~ /[0-9]+/)
    {
         totalHP+=$5
    }

    else if($6 ~ /[0-9]+/)
    {
        totalHP+=$6
    }
    
    else
    {
        totalHP+=$7
    }
} END{print totalHP}')

avgHP=$( expr $totalHP / $totalPokemon )

# calculate total Attack

totalAttack=$(tail +2 pokemon.dat | awk '{
    if($5 ~ /[0-9]+/)
    {
         totalAttack+=$6
    }

    else if($6 ~ /[0-9]+/)
    {
        totalAttack+=$7
    }
    
    else
    {
        totalAttack+=$8
    }
} END{print totalAttack}')

avgAttack=$( expr $totalAttack / $totalPokemon )

# display results

printf "===== SUMMARY OF DATA FILE =====\n"
    # display file name
printf "    File name: $filename\n"
    # display total pokemon
    
printf "    Total Pokemon: $totalPokemon\n"

    # display avg HP
printf "    Avg. HP: $avgHP\n"
    # display avg attack
printf "    Avg. Attack: $avgAttack\n"


printf "===== END SUMMARY =====\n"





