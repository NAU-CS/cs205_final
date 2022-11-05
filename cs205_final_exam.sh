# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

#read -u v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12
#i=1
#sum=0
#while [ $i -le $N ]
#do
#    read v6
    
#  sum=$((sum + num))   
#  i=$((i + 1))
#done

#avg_hp=$(echo $sum / $N | bc -l)
#echo $avg_hp
    
# echo "v1:$v1 v2:$v2 v3$v3 v4:$v4 v5:$v5 v6:$v6"
# done < pokemon.dat

#Couldn't get the read function to work properly, as it was giving me syntax errors


# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
