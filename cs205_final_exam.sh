# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

#call awk script
#begin awk script by telling awk to delimit by tab
#create sumhp variable and add everything in column 6 to it
#create sumattack variable and add everything in column 7 to it
#call end behavior in awk
awk 'BEGIN {FS="\t"} {sumhp += $6; sumattack += $7} END {

#calculate avg hp by dividing the sumhp by the number of rows
avghp = sumhp / NR;

#calculate avg attack by dividing the sumhp by the number of rows
avgattack = sumattack / NR;

#print header
print "===== SUMMARY OF DATA FILE =====";

#print filename
print "    File name: " FILENAME;

#print total pokemon (represented by number of rows)
print "    Total Pokemon: " NR;

#print avg pokemon hp (sum of row 6 divided by number of rows)
print "    Avg. HP: " avghp;

#print avg pokemon attack (sum of row 7 divided by number of rows)
print "    Avg. Attack: " avgattack;

#print end summary statement
print "===== END SUMMARY =====";

#end awk script and pass in argument 1 of bash script as filename to awk script
} ' $1

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
