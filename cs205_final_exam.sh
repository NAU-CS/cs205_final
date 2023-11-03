#TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script corrrectly calculates the values that go into the [VALUE] placeholders):
#======= SUMMARY OF POKEMON.DAT ======
#       Total Pokemon: [VALUE]
#       Avg. HP: [VALUE]
#       Ag. Attack: [VALUE]
#======= END SUMMAY ========

#Check for command line arguement
if [$# -ne 1 ]; then
	echo "Usage: $0 <data_file>"
	exit 1
fi

#Store file name
data_file="$1"

#Check if file exists
if [ ! -f "$data_file" ]; then
	echo "Error: File '$data_file' not found."
	exit 1
fi

#Start calc
awk 'BEGIN {
	#Create variables
	total_pokemon = 0
	total_hp = 0
	total_attack = 0
}

NR > 1 {
	total_pokemon++
	total_hp += $5
	total_attack += $6
}

END {
	avg_hp = total_hp/total_pokemon
	avg_attack = total_attack/total_pokemon

	printf("=========== SUMMARY OF %s ==========\n", FILENAME)
	printf("     Total Pokemon: %d\n", total_pokemon)
	printf("     Avg. HP: %f\n", avg_hp)
	printf("     Avg. Attack %f\n", avg_attack)
	printf("============= END SUMMARY ==========\n")
}' "$data_file"
