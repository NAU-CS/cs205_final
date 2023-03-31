Last login: Sat Mar 18 01:05:31 on console
apple@Apples-iMac ~ % vi c205_final_exam.sh






















# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
#!/bin/bash

# Assign the filename
filename=$1

# Use awk to extract data from the file and calculate the summary statistics
total=$(awk '{total++} END{print total}' $filename)
avg_hp=$(awk '{sum+=$6} END{print sum/NR}' $filename)
avg_attack=$(awk '{sum+=$7} END{print sum/NR}' $filename)

# Print the summary report
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $filename"
echo "   Total Pokemon: $total"
echo "   Avg. HP: $avg_hp"
echo "   Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="

~                                                                               

