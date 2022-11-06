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
{
#Initializes Variables for script
FILE=$1
hp_sum=0
attack_sum=0
t_pokemon=NR-1
}

{
	#loops through file lines to add up sums
	for (i = 1; i<= NR; i++)
		{
			#adds the value in the column to the sum
			hp_sum=hp_sum+$8
			attack_sum=attack_sum+$9
		}
		#calculates averages
		avg_hp=hp_sum/(NR-1)
		avg_attack=avg_attack/(NR-1)

}

{
#prints final data statements
print "File name: $FILE"
print "Total Pokemon: $t_pokemon"
print "Avg. HP: $avg_hp"
print "Ang. Attack: $avg_attack"
}
