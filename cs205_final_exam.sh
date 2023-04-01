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
#

COUNT=$(awk -F "\t" "{if (NR != 1) {print \$2}}" $1 | sort | uniq | wc -l) # Prints all pokemon names excluding the heading, sorts and removes duplicates, then counts results.

echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $1" # simply prints first argument name.
echo "   Total Pokemon: $COUNT" # prints count from earlier.
echo "   Avg. HP: $(awk -F "\t" "{if (NR != 1) {hp += \$5}} END {print hp / $COUNT}" $1)" # Adds all HPs together (excluding first line) then divides total by count.
echo "   Avg. Attack: $(awk -F "\t" "{if (NR != 1) {attack += \$6}} END {print attack / $COUNT}" $1)" # Adds all attack stats together (excluding first line) then divides total by count.
echo "===== END SUMMARY ====="
