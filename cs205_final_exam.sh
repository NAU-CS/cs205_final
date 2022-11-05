#!/bin/bash

#prints out the top line 

echo ==== SUMMARY OF DATA FILE ====

#reads the file name 

read -p "Enter file name : " filename

#produce the folllwing command 
echo $line

#while it can read the file name do this 
while read line

#trying to format the out put
$ cat pokemon.dat  | column -t -s " "

do 

# prints the output of the number of pokemon 
echo Total Pokemon: 

# adds up the first column aka number of pokemon 
cat pokemon.dat | awk ‘{ sum+=$2} END {print sum}’

#print a new line with an empty echo

echo 

# prints the output of the hp of the pokemon
echo Avg. HP: 

#adds up the total hp of the pokemon 

cat pokemon.dat | awk ‘{ sum+=$6} END {print sum}’

#print a new line with an empty echo

echo 

# prints the output of the average attack
echo Avg. Attack: 

#adds up the attack 
cat pokemon.dat | awk ‘{ sum+=$7} END {print sum}’

#printing out the last line of the program
echo ==== END SUMMARY ====

# done with the file 
done < $filename
