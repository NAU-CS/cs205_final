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

#check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 ,pokemon_data_file>"
    exit 1
fi

#Assign the filename passes as arguments to a variable
filename=$1

#calculate the total number of pokemon
total_pokemon=$(awk 'END {print NR}' $filename)

#calculate the average HP and attack using awk
avg_hp=$(awk '{total += $2} END {print total/NR}' $filename)
avg_attack=$(awk '{total += $3} END {print total/NR}' $filename)

#print the summary report
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $filename"
echo "   Total Pokemon: $total_pokemon"
echo "   Avg. HP: $avg_hp"
echo "   Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="
