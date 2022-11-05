
# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]

BEGIN {printf "File name: "} END {print FILENAME}

#    Total Pokemon: [VALUE]
END {printf "Total Pokemon: "} END {print NR-1}

#    Avg. HP: [VALUE]
END {printf "Avg. HP: "} END {HP_SUM+=$6} END {LINES=NR-1} END {HP_AVERAGE=HP_SUM/LINES} END {print HP_AVERAGE}

#    Avg. Attack: [VALUE]
END {printf "Avg. Attack: "} END {ATK_SUM+=$7} END {LINES=NR-1} END {ATK_AVERAGE=ATK_SUM/LINES} END {print ATK_AVERAGE}


# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
