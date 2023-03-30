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


# Start of the script File.
BEGIN {
# Sets the initial value for the total pokemon.
  total_pokemon = 0
# Sets the initial value for the total_hp that we will be calculating the sum of.
  total_hp = 0
# Sets the initial value for the total_attack that we will be calculating the sum of.
  total_attack = 0
}

{
# Counts the total number of rows in the file and sets it equal to the total amount of Pokemon. We will later subtract 1 due to the first row being the header.
  total_pokemon += 1
  
# Count up and total the amount for the column containing the HP of each pokemon (column 6).
  total_hp += $6
# Count up and total the amount for the column containing the HP of each pokemon (column 7).
  total_attack += $7
}
# We then end the script by doing the following:
END {
# Calculate averages for the HP by dividing the total HP by the total amount of Pokemon.
  avg_hp = total_hp / total_pokemon
# Calculate averages for the Attack by dividing the total Attack by the total amount of Pokemon.
  avg_attack = total_attack / total_pokemon
  
# We then finish by printing the start of the summary
  printf("# ===== SUMMARY OF DATA FILE =====\n")
# This line takes whatever file we are running the script on and prints the name of it.
  printf("#    File name: %s\n", FILENAME)
# This line prints the total amount of pokemon (or lines) and subtracts it by one so that it is not counting the header as a pokemon.
  printf("#    Total Pokemon: %d\n", total_pokemon-1)
# This line grabs the total from the average HP equation and prints it out.
  printf("#    Avg. HP: %.2f\n", avg_hp)
# This line grabs the total from the average attack equation and prints it out.
  printf("#    Avg. Attack: %.2f\n", avg_attack)
# We then end it by printing out END SUMMARY
  printf("# ===== END SUMMARY =====\n")
}

	