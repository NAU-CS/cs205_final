#!/bin/bash

# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====
file_name=$1
total_poke=0
avg_hp=0
avg_att=0

echo $file_name
echo $total_poke
echo $avg_hp
echo $avg_att

# BEGIN{FS = "\t"} {total_poke = 0} {avg_hp = 0} {avg_att = 0} {file_name = $1}

# {total_poke = $1} {avg_hp = avg_hp + $6} {avg_att = avg_att + $7}

# END{ printf "===== SUMMARY OF DATA FILE =====" }
#{ print "     File name: $file_name" }
#{ print "     Total Pokemon: $total_poke" }
#{ print "     Avg. HP: $avg_hp/NR" }
#{ print "     Avg. Attack: $avg_att/NR" }
#{ print "===== END SUMMARY =====" }

# total pokemon could just be the number at the last line

# avg. hp, iterate through each line, adding 1 to count and adding hp to total

# avg. attack, iterate through each line, adding to count and adding attack to total



 
# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
