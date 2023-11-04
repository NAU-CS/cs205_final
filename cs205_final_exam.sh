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
if [$# -ne 1 ]; then
	echo "Usage: $0 best_pokemon.dat"
exit 1
fi

awk 'BEGIN {
    FS="\t";  
    print "Stat\tMin\tMax\tAvg.";
}
{
    total += $2; 
    count++;
}
END {
    avg_attack = total / count;
    print "Attack\t-999\t999\t" avg_attack;
}' "$1"

exit 0
