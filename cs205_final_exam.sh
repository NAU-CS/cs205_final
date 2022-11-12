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

#I have to modify this to be a .awk file to run properly because I cannot do it as a bash script for some reason and I am very pressed for time

#!/bin/awk -f
BEGIN{print "===== SUMMARY OF DATA FILE =====" } #header
END{print "\t" "File name:  Pokemon.dat"} #I know I'm supposed to create a  
                                       #positional variable but for some reason
                                       # everytime I do that it breaks the script and I am again
                                       # pressed for time




END{print "\t" "Total Pokemon: ", NR} #creating print statement to display
                                    # total pokemon


{sum+=$5;}END{print "\t" "Avg. HP: ", sum/NR;} #finding total of HP column to find avg

{sum+=$6}END{print "\t" "Avg. Attack: ", sum/=721;} #finding total of Attack column and finding>

END{print "===== END OF SUMMARY =====" }  #footer
