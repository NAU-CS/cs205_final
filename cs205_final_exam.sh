#!/bin/bash

file="pokemon.dat"						# assigns whats in the .dat to "file" 
total=$(awk 'END{print NR}' $file)				# this gets the total # of pokemon and saves it to the variable total
avg_hp=$(awk '{sum +=$6} END{print sum/NR}' $file) 		# this is supposed to get the average hp of the pokemon which is around 69, I tried using the code 
								# "(awk 'BEGIN{FS='\t'} {sum+=$6 if (NR!=1) {hp+=1} } END{print sum/NR}' $file)" which was provided by the 
								# professor after HW 1 but I kept getting a syntax error 
								# pokemon as per the code provided by 
avg_attack=$(awk '{sum += $7} END{print sum/NR}' $file)		# this gets the average attack of the 	
								# pokemon

echo "===== SUMMARY OF DATA FILE ====="				# the rest of these lines put the answer 
echo "   File name: $file"					# into the requred template by passing 
echo "   Total Pokemon: $total"					# the vaiables which have the hopefully 
echo "   Avg. HP: $avg_hp"					# correct number in them using the echo
echo "   Avg. Attack: $avg_attack"				# command.
echo "===== END SUMMARY ====="					#

