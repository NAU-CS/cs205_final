# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====
#!/bin/sh

FILE=pokemon.dat

echo "===== SUMMARY OF DATA FILE =====" #header is in its own line

echo | awk 'Begin{line=0}{line++}{sum+=$6}{sum1+=$7} END{print "   " "File name: pokemon.dat" "\n" "   " "Total Pokemon: ", line-1 "\n" "   " "Avg. HP: ", sum/800 "\n" "   " "Avg. Attack: ", sum1/800 "\n" "===== END SUMMARY ====="}' pokemon.dat #in this line, i count the lines, sum column 6, and sum column 7, i then print out the lines, the average attack/800, and average hp/800 all in one line. I also put the footer in this line of code







# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
