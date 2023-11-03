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

# Check if a filename is provided as a positional parameter.
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <data_file>"
    exit 1
fi

# Assign the input file from the first positional parameter.
data_file="$1"

# Check if the file exists.
if [ ! -f "$data_file" ]; then
    echo "File not found: $data_file"
    exit 1
fi

# Use awk to process the data file and calculate summary statistics.
awk 'BEGIN {
    # Initialize variables to hold total and count values.
    total_pokemon = 0
    total_hp = 0
    total_attack = 0
}

# Process each line of the file.
{
    # Add the values from the current line to the totals.
    total_pokemon++
    total_hp += $2
    total_attack += $3
}

# END block executes after processing all lines.
END {
    # Calculate average values.
    avg_hp = total_hp / total_pokemon
    avg_attack = total_attack / total_pokemon

    # Print the summary report.
    printf("======= SUMMARY OF %s =======\n", FILENAME)
    printf("   Total Pokemon: %d\n", total_pokemon)
    printf("   Avg. HP: %.2f\n", avg_hp)
    printf("   Avg. Attack: %.2f\n", avg_attack)
    printf("======= END SUMMARY =======\n")
}' "$data_file"
