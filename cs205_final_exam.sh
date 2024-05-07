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
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted

#Calculate the average HP and attack
#Begins on 2nd line, skips header
NR == 1 {next}

BEGIN{
	#Makes delimiter [TAB] and not just [SPACE] to solve misalignment
	FS ="\t"
	#Initialize the variables
	total_pokemon = 0
	total_hp = 0
	total_attack = 0
}

{
	#Add 1 to total pokemon after each line
	total_pokemon ++
	#Add the value of the hp and attack to the total for each line 
	total_hp += $6
	total_attack += $7
}
END {
	#print the header
	print "===== SUMMARY OF DATA FILE =====";

	#Print the filename
	print "   File name: ", FILENAME;

	#Print the total number of pokemon
	print "    Total Pokemon: ", total_pokemon;

	#Calculate mean hp and attack
	average_hp = total_hp / total_pokemon
	average_attack = total_attack / total_pokemon
	#Print results
	print "    Avg. HP: ", average_hp;
	print "    Avg. Attack: ", average_attack;

	#Print end
	print "===== END SUMMARY ====="
}
