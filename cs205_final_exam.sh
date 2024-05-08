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

awk '
# begin the AWK
BEGIN{HPPIVOT=7}
# Get the HP from the 7th column from the right.
BEGIN{ATKPIVOT=6}
# Get the attack from the 6th column on the right.
NR>1 {HPSUM+=$(NF - HPPIVOT)}
# Add every line HP stat to a variable.
NR>1 {ATKSUM+=$(NF - ATKPIVOT)}
# Add every line attack stat to a variable.
END{MEANHP = HPSUM / (NR - 1)}
# Divide every line HP by every line to get an average.
END{MEANATK = ATKSUM / (NR - 1)}
# Likewise, divide the attack sum by the lines.
END{ print "===== SUMMARY OF DATA FILE ====="}
# print the header
END{ print "   File name: " (FILENAME) }
# Self explanatory, just prints the FILENAME for the filename.
END{ print "   Total Pokemon: " $(1) }
# Since some pokemon are counted multiple times (For variants), just use the 1st field on the last line.
END{ print "   Avg. HP: " MEANHP}
# Print the mean HP
END{ print "   Avg. Attack: " MEANATK}
# Print the mean attack
END{ print "===== END SUMMARY ====="}
# Print the footer
' $1
# Take in the first argument to get the file
