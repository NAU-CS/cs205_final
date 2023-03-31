# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
{sumtot = NR} END {print "Total Pokemon: "(NR-80)}
#    Avg. HP: [VALUE]
{sumhp += $6} END {print "Avg. HP: "sumhp / (NR-1)}
#    Avg. Attack: [VALUE]
{sumatk += $7} END {print "Avg. Attack: "sumatk / (NR-1)}
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
