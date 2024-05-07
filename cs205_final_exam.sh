#!/bin/bash

# TODO: Modify this file to create a shell script that is able to use awk to go
# through a file formatted like best_pokemon.dat and provides a printed report
# in the following format (where your script correctly calculates the values
# that go into the [VALUE] placeholders):

# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script.
# The data file will be passed in to the script as a positional parameter and
# will not necessarily be called best_pokemon.dat. However, you can assume that
# any file passed to this script will be formatted exactly the way
# best_pokemon.dat is formatted.


# Note: 'realpath' is used for purposes of briefly debugging submission.
DATA_FILE=$(realpath "best_pokemon.dat")
avg_hp=0
avg_attack=0

##############################
## File Checks ###############
##############################

# Check if data file exists
if [[ ! -e "$DATA_FILE" ]]; then
  echo "Error: File '$DATA_FILE' does not exist!"
  echo "Exiting..."
  exit 1
fi

# Check if data file is readable
if [[ ! -r "$DATA_FILE" ]]; then
  echo "Error: File '$DATA_FILE' is not readable!"
  echo "Exiting..."
  exit 1
fi


##############################
## Get Required Data #########
##############################

# Get columns from data file
all_hp=$(cat "$DATA_FILE" | awk '{ print $5 }' | tail -n +2)
all_attack=$(cat "$DATA_FILE" | awk '{ print $6 }' | tail -n +2)
num_items=$(( $(cat "$DATA_FILE" | wc -l) - 1 ))  # "Mega" Pokémon are counted
                                                  # as separate Pokémon

# Calculate average HP
for hp_item in $all_hp; do
  avg_hp=$(( "$avg_hp" + "$hp_item" ))
done
avg_hp=$(( "$avg_hp" / "$num_items" ))

# Calculate average attack
for attack_item in $all_attack; do
  avg_attack=$(( "$avg_attack" + "$attack_item" ))
done
avg_attack=$(( "$avg_attack" / "$num_items" ))


##############################
## Display results ###########
##############################

echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $(basename $DATA_FILE)"
echo "   Total Pokemon: $num_items"
echo "   Avg. HP: $avg_hp"
echo "   Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="
