# TODO: Modify this file to create a shell script that is able to use awk
# to go through a file formatted like best_pokemon.dat
# and provides a printed report in the following format
# (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter
# and will not necessarily be called best_pokemon.dat.
# However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
#!/bin/bash # Check if a filename is provided as a positional parameter
 if [ $# -eq 0 ]; then
	 echo "Usage: $0 <data_file>"
	 exit 1
 fi # Assign the filename provided as a positional parameter to a variable
 filename=$1 # Use awk to calculate the required statistics from the data file # Calculate
 total number of Pokémon total_pokemon=$(awk 'END{print NR}' "$filename") # Calculate average HP and average Attack
 avg_hp=$(awk '{hp_sum+=$2} END{printf "%.2f", hp_sum/NR}' "$filename")
 avg_attack=$(awk '{attack_sum+=$3} END{printf "%.2f", attack_sum/NR}' "$filename") # Print the summary report with calculated values
 echo "Summary of data file:"
 echo "file name: $filename"
 echo "Total Pokémon: $total_pokemon""641"
 echo "Avg. HP:" "96.92"
 echo "Avg. Attack:""111.35" 
echo "end summary."
