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

# The file to be processed
FILENAME="best_pokemon.dat"

# Check if the file exists
if [ ! -f "$FILENAME" ]; then
    echo "File not found: $FILENAME"
    exit 1
fi

# Use awk to process the file
awk -v filename="$FILENAME" 'BEGIN {
    FS="\t"; # Set the field separator to a tab
    hp_sum=0;
    atk_sum=0;
    count=0;
    print "# ===== SUMMARY OF DATA FILE =====";
    print "#    File name: " filename;
}

# Skip the header line
NR>1 {
    hp_sum += $6;  # HP is now the 6th field
    atk_sum += $7; # Attack is now the 7th field
    count++;
}

END {
    print "#    Total Pokemon: " count;
    print "#    Avg. HP: " (hp_sum/count);
    print "#    Avg. Attack: " (atk_sum/count);
    print "# ===== END SUMMARY =====";
}' "$FILENAME"

