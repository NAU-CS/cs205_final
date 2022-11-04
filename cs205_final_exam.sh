# TODO: Modify his file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]

BEGIN {
    FILENAME = ARGV[1]
}

{
    if (NR > 1) HP += $6
#calculate all the HP without line 1
    if (NR > 1) AT += $7
#calculate all the ATTACK without line 1
    Avg.HP = HP / (NR-1)
#calculate the average HP
    Avg.AT = AT / (NR-1)
#calculate the average Attack
}

END{

	print "====== SUMMARY OF DATA FILE ======"
	print "\tFile name: ",FILENAME;
	print "\tTotal Pokemon: ",NR-1;
	print "\tAvg.HP: ",Avg.HP;
	print "\tAvg.Attack: ",Avg.AT;
	print "===== END SUMMARY =====";
}
# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
