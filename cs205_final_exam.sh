#!/bin/awk -f
#start of the script
BEGIN {
#set the filed separator for .dat
	FS = "	"
#make a total pokemon var
	total = 0
#make a average health var
	avg_hp = 0
#make a average attack var
	avg_attack = 0
}
#start the data processing
{
if (FNR > 1) {       #ignore the first line because that is only column names
	total += 1 #add one to toatal pokemon
	avg_hp += $6 #add hp of pokemon to avg_hp, column 6 holds HP vaule
	avg_attack += $7 #add attack of pokemon to avg_attack, column 7 holds attack vaule
} 
    
}
#End of reading lines
END {
#print head
    print " ===== SUMMARY OF DATA FILE ====="
#print filename, FILENAME is a default var in awk
    print "    File name: ", FILENAME
#print num of pokemon
    print "    Total Pokemon: ", total
#calculate and print average health
    print "    Avg. HP: ", avg_hp/total
#calculate and print average attack
    print "    Avg. Attack: ", avg_attack/total
#print footer
    print " ===== END SUMMARY ====="
}



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
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to #this script will be formatted exactly the way best_pokemon.dat is formatted.


