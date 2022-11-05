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

awk 'FNR == 1{ print "===== SUMMARY OF DATA FILE =====" } ' pokemon.dat

awk 'FNR == 1{ print "File name: " FILENAME }' pokemon.dat

awk 'END{ print "Total Pokemon: " NR }' pokemon.dat

awk 'BEGIN{ FS = "\t"; sum=0 }
{ sum += $6 }
END{ print "Avg. HP: " sum / NR }' pokemon.dat

awk 'BEGIN{ FS = "\t"; sum=0 }
{ sum += $7 }
END{ print "Avg. Attack: " sum / NR }' pokemon.dat

awk 'FNR == 1{ print "===== END SUMMARY =====" }' pokemon.dat
