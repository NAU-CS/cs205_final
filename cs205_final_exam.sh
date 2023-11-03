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
#!/bin/bash

# input desired file 
pokemon_file=$1

awk 'BEGIN {
    # initialize variables
    t_pokemon = 0
    t_hp = 0
    t_attack = 0
  }
  {
    # count pokemon
    t_pokemon++
    # add up total hp from respective column
    t_hp += $6
    # add up total attack from respective column
    t_attack += $7
  }

  END {
    # calculate the average of each
    avg_hp = t_hp / t_pokemon
    avg_attack = t_attack / t_pokemon
    # print output to user
    print "===== SUMMARY OF DATA FILE ====="
    printf "File name: %s\n",ARGV[1]
    printf "Total Pokemon: %d\n", t_pokemon
    printf "Avg. HP: %.2f\n", avg_hp
    printf "Avg. Attack: %.2f\n", avg_attack
    print "===== END SUMMARY ====="
  }' "$pokemon_file"
' 
