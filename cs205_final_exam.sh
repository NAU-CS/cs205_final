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
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted
#!/bin/bash

# Purpose: Generate a report on the statistics of Pokémon data from a given file formatted similarly to best_pokemon.dat
# The script takes a file as a positional parameter and provides a summary report.
#!/bin/bash

# Purpose: Generate a report on the statistics of Pokémon data from a given file formatted similarly to best_pokemon.dat
# The script takes a file as a positional parameter and provides a summary report.
#!/bin/bash

# Purpose: Generate a report on the statistics of Pokémon data from a given file formatted similarly to best_pokemon.dat
# The script takes a file as a positional parameter and provides a summary report.
#!/bin/bash

# Purpose: Generate a report on the statistics of Pokémon data from 
#!/bin/bash

# Check if a filename is provided as an argument
if [ -z "$1" ]; then
    echo "Please provide a filename as an argument."
    exit 1
fi

# Store the filename passed as an argument
filename=$1

# Using awk to calculate the summary values
awk -F '\t' '
NR == 1 {
    # Store the column numbers based on headers
    for (i = 1; i <= NF; i++) {
        if ($i == "HP") hp_col = i
        if ($i == "Attack") attack_col = i
    }
}

NR > 1 {
    totalPokemon++
    totalHP += $hp_col
    totalAttack += $attack_col
}

END {
    avgHP = totalHP / totalPokemon
    avgAttack = totalAttack / totalPokemon

    printf("===== SUMMARY OF DATA FILE =====\n")
    printf("   File name: %s\n", FILENAME)
    printf("   Total Pokemon: %d\n", totalPokemon)
    printf("   Avg. HP: %.2f\n", avgHP)
    printf("   Avg. Attack: %.2f\n", avgAttack)
    printf("===== END SUMMARY =====\n")
}' "$filename"

