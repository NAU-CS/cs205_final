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
#!/bin/bash

# Input file
file="best_pokemon.dat"

# Use awk to process the file with tab as the delimiter and calculate the values
awk -F'\t' '
BEGIN {
    totalPokemon = 0
    totalHP = 0
    totalAttack = 0
    seenPokemon = ""
}

NR > 1 {
    # Check if we have already seen this Pokémon ID
    if (!($1 in seenPokemon)) {
        totalPokemon++
        seenPokemon[$1] = 1
    }
    
    totalHP += $6
    totalAttack += $7
}

END {
    avgHP = totalHP / totalPokemon
    avgAttack = totalAttack / totalPokemon

    print "===== SUMMARY OF DATA FILE ====="
    print "File name: "FILENAME
    print "Total Pokemon: "totalPokemon
    printf "Avg. HP: %.2f\n", avgHP
    printf "Avg. Attack: %.2f\n", avgAttack
    print "===== END SUMMARY ====="
}' "$file"
