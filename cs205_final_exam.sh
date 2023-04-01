# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

filename=$1 # This line taks the first input parameter what sotres it in a variable called "filename"

total=$(awk 'END {print NR}' $filename) #This line finds the total number of rows in the data file. This directly corresponds with the amount of pokemon in the file. Thsi is being stored in a variable called "total"

avghp=$(awk '{sum += $4} END {print sum / NR}' $filename) #This line sums up all of the number values in the fourth column and divides it by the number of rows to find the average. This is being stored in a variable called "avghp"

avgattack=$(awk '{sum += $5} END {print sum / NR}' $filename) #This lines sums up all of the values in the fifth column and divides that number by the number of rows to find the average attack of all pokemon. This is being stored in a variable called "avgattack"

echo "===== SUMMARY OF DATA FILE =====" #This line displays in the command prompt

echo "    File name: $filename" #This lines takes our variable "filename" and displays it after our $ indicator

echo "    Total Pokemon: $total" #This line takes our variable "total" and displays it after our $ indicator

echo "    Avg. HP: $avghp" # This line prints our "avghp" varaible after our $ indicator

echo "    Avg. Attack: $avgattack" #This line prints our "avgattack" variable after our $ indicator. 

#*** When mentioning print, i mean that it is displaying the the command prompt nice and pretty for users to read. :)

echo " ===== END SUMMARY =====" #This line displays in the command prompt

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.