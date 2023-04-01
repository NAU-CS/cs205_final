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

# creating variables
sum_hp=0
sum_at=0

# printing the header
echo "===== SUMMARY OF DATA FILE ====="

# printing th name of the file
echo "   File name: $1"

# printing how many total pokemon their are
awk 'FNR==1{printf"   Total Pokemon: "} END{print $1}' $1

# sorting through the 6th column of data and calculating the average
awk 'FNR==1{printf"   Avg. HP: "}{sum_hp += $6} END{print sum_hp/NR}' $1

# sorting through the 7th column of data and calculating the average
awk 'FNR==1{printf"   Avg. Attack: "}{sum_at += $7} END{print sum_at/NR}' $1

# printing the ending line
echo "===== END SUMMARY ====="
