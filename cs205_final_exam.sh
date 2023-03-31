# TODO: Modify this file to create a shell script that is able to use awk to go though a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):

#===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

# Assign the filename
file=$1

# Use awk to calculate the total pokemon statistics
total=$(awk '{total++} END{print total-1}' $file)

# Use awk to calculate the average HP
hp=$(awk '{sum+=$6} END{print sum/$total}' $file)

# Use awk to calculate the average attack
attack=$(awk '{sum+=$7} END{print sum/$total}' $file)

# Print the summary report
echo "==== SUMMARY OF DATA FILE ===="
echo "File name: $file"
echo "Total Pokemon: $total"
echo "Avg. HP: $hp"
echo "Avg. Attack: $attack"
echo "==== END SUMMARY ===="
