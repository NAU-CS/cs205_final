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

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <data_file>"
    exit 1
fi

data_file="$1"

awk_script='
BEGIN {
    total_hp = 0
    total_attack = 0
}

# Set the field separator to tab character '\t'.
BEGIN { FS = "\t" }

{
    total_hp += $6
    total_attack += $7
}

END {
    avg_hp = (NR > 0) ? total_hp / NR : 0
    avg_attack = (NR > 0) ? total_attack / NR : 0

    printf("===== SUMMARY OF DATA FILE =====\n")
    printf("   File name: %s\n", FILENAME)
    printf("   Total Pokemon: %d\n", NR)
    printf("   Avg. HP: %.2f\n", avg_hp)
    printf("   Avg. Attack: %.2f\n", avg_attack)
    printf("===== END SUMMARY =====\n")
}
'

awk -f <(echo "$awk_script") "$data_file"

