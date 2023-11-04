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
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

filename="$1"

awk '
	BEGIN {
		total_pokemon = 0
		total_hp = 0
		total_attack = 0
	}
	{
		total_pokemon++
		total_hp += $2
		total_attack += $3
	}
	
	END {
		if (total_pokemon > 0) {
			avg_hp = total_hp / total_pokemon
			avg_attack = total_attack / total_pokemon
		} else {
			avg_hp = 0
			avg_attack = 0
		}
		
		print "File name: " FILENAME
		print "Total Pokemon: " total_pokemon
		printf "Avg. HP: %.2f\n", avg_hp
		printf "Avg. Attack: %.2f\n", avg_attack
	}
' "$filename"
