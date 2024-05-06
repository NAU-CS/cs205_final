# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====

# Check if the user has provided a file as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <data file>"
    exit 1
fi

# Assign the file name to a variable
filename=$1

# Use awk to process the file, summarizing Pokémon data
awk -v file="$filename" -F '\t' 'BEGIN {
    total_hp = 0;
    total_attack = 0;
    count = 0;
}

# Skip the header and accumulate data from data lines
NR > 1 {
    total_hp += $5;       # Sum HP values from the 5th column
    total_attack += $6;   # Sum Attack values from the 6th column
    count++;              # Increment the counter for each line processed
}

END {
    # Calculate average values
    avg_hp = total_hp / count;
    avg_attack = total_attack / count;
    
    # Print the summary including the file name
    print "===== SUMMARY OF DATA FILE =====";
    print "   File name: " file;
    print "   Total Pokemon: " count;
    printf "   Avg. HP: %.2f\n", avg_hp;
    printf "   Avg. Attack: %.2f\n", avg_attack;
    print "===== END SUMMARY =====";
}' "$filename"

#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
