# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ======= SUMMARY OF POKEMON.DAT ======
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ======= END SUMMARY =======

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script.
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

# prints the header 
echo "====== SUMMARY OF POKEMON.DAT ======"

# prints total count of pokemon in .dat file
echo -n "Total Pokemon: "

# counts the unique values in the id column of the .dat file
awk '{ count[$2]++ } END { print length(count) }' pokemon.dat

# prints average hp of all pokemon in .dat file
echo -n "Avg. HP: "

# calculates the mean hp of the pokemon
awk '{ if($4 > 100) total_hp += $4; else if($5 > 100) total_hp += $5; else if($6 > 100) total_hp += $6; else if($7 > 100) total_hp += $7 } END { print total_hp / (NR - 1) }' pokemon.dat

# prints the average attack of all pokemon in .dat file
echo -n "Avg. Attack: "

# calculates the mean attack of the pokemon
awk '{ if($4 > 180) total_att += $5; else if($5 > 180) total_att += $6; else if($6 > 180) total_att += $7; else if($7 > 180) total_att += $8 } END { print total_att / (NR - 1) }' pokemon.dat

# prints end of summary
echo -n "====== END SUMMARY ======"
