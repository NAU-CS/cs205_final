#!/bin/awk -f
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
awk 
begin {
	FS="\t"
	avg_hp=0;
	avg_atk=0;
	total=-1;
}
{
	if(NR>1) {
		total++;
		avg_hp+=$6;
		avg_atk+=$7;
	}
}
END {
	avg_hp=avg_hp/total;
	avg_atk=avg_atk/total;
	print "===== SUMMARY OF DATA FILE =====";
	print "File name: " ARGV[1];
	print "Total Pokemon: " total;
	print "Avg. HP: " avg_hp;
	print "Avg. Attack: " avg_atk;
	print "===== END SUMMARY =====";
}

