# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

awk -f 'BEGIN{FS="\t"}' pokemon.dat #Set tab as field separator
awk 'END{print "File name: " FILENAME }' pokemon.dat #Print filename
awk 'END{print "Total Pokemon: " (NR - 1)}' pokemon.dat #print total pokemon minus one because of title/first line
awk 'END{ print "Avg. HP: " ((sum+=$6)/(NR-1))}' pokemon.dat #print avg HP 
awk 'END{ print "Avg. Attack: " ((sum+=$7)/(NR-1))}' pokemon.dat #print avg attack

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
