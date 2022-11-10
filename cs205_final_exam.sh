#!/usr/bin/awk -f
#shebang

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

#print filename
FILE="$(basename $1)"

echo $FILE
#it will then start a count going down by each row in the $numbered column
BEGIN{FS="\t";count = 0}

#this will get the count of total pokemon
{count+=1}  
  

END{print count}



BEGIN{FS="\t";hp = 0}

#this will get the count of total pokemon
{hp+=$6}  
  
#get the average
END{print hp /( NR) }


BEGIN{FS="\t";attack = 0}

#this will get the count of total pokemon
{attack+=$7}  
  
#get the average
END{print attack /( NR) }


