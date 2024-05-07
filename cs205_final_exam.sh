# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Use awk to calculate and print summary of the Pokemon data file
awk 'BEGIN {
    PCNT=0; THP=0; TATCK=0; FS="\t"
} 
NR>1 {
    PCNT+=1; THP+=$6; TATCK+=$7;
} 
END {
    printf "===== SUMMARY OF DATA FILE =====\n   File name: %s\n   Total Pokemon: %d\n   Avg. HP: %f\n   Avg. Attack: %f\n===== END SUMMARY =====\n", FILENAME, PCNT, THP/PCNT, TATCK/PCNT
}' "$1"

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

