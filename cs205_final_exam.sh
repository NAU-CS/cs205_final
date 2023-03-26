# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: pokemon
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
# function pokemon {
#     awk 'END{print NR-1}' pokemon.dat
# }
# function fileName {
#     awk 'BEGIN {print "File Name\n"}' 
# }
# awk 'BEGIN {print "Avg. HP: "}'
# awk 'BEGIN {print 25}'
#pokemon
#fileName
#awk '{print $(NF-7)/NR-1}' pokemon.dat #think this is hp?
export FILENAME=$1 #accepts the last field entered in the previous command as the variable FILENAME
awk 'BEGIN{print "===== SUMMARY OF DATA FILE ====="}' #prints the first line
awk 'BEGIN{print "   File name: " ENVIRON["FILENAME"]}' #prints FILENAME
awk 'END{print "   Total Pokemon: "NR-1}' $FILENAME #prints how many pokemon there are minus one because the first row is not a pokemon
awk '{sum+=(NF-7);} END {print "   Avg. HP: " sum/(NR-1)}' $FILENAME #Finds the average hp of the pokemon
awk '{sum+=(NF-6);} END {print "   Avg. Attack: " sum/(NR-1)}' $FILENAME #Finds the average attack of all the pokemon
awk 'BEGIN{print "===== END SUMMARY ====="}' #prints final line
#awk '{print $(NF-6)/NR-1}' pokemon.dat #should be attack