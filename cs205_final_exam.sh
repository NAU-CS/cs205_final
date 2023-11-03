



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

# only run on first line
BEGIN {
# set newline character to tabs
FS="\t";
# initialize lines, hp, and attack sum variables
lines=0;
hp=0;
atk=0;
}

{
# don't run on first (header) line
if (NR != 1) {
# add 1 to lines
lines += 1;
# add hp to sum
hp += $6;
# add attack to sum
atk += $7;
}
}

# only run on last line
END {
# print header
print "===== SUMMARY OF DATA FILE =====";
# print filename, total num of pokemon, avg hp, and avg attack
print "   File name: " FILENAME;
print "   Total Pokemon: " lines;
print "   Avg. HP: " hp/lines;
print "   Avg. Attack: " atk/lines;
# print footer
print "===== END SUMMARY =====";
}

