# DONE: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
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

# saves the positional argument to a FILE variable
FILE="$1"
# checks to see if the file exists.
if [[ -e "$FILE" ]]; then
    # if the file exists, then use awk to process the file.
    awk 'BEGIN{FS="\t"} {sumHP+=$6} {sumAttack+=$7} END{printf "File name: %s\n Total Pokemon: %d\n Avg. HP: %d\n Avg. Attack: %d\n", FILENAME, NR, sumHP/NR, sumAttack/NR}' $FILE
else
    # if the file DNE, make sure to tell the user that the file doesn't exist!
    echo "$(pwd)/$FILE does not exist!"
fi
# end
