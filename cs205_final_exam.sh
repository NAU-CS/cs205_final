
#Initilize the file and passing data as a positional parameter.
declare FILE=${1} 
#temp file to hold new values not conaitng mega
temp_file=$(mktemp)
#removing mega and transfering data to temp output file
grep -v "Mega" $FILE > $temp_file
echo "===== SUMMARY OF DATA FILE ====="
#print name
echo "   File name: $FILE"
echo "Total Pokemon: "
#Using awk I pass the temp file and set a tab delimieter while skipping the first line. Keep running sum and print the value. For the others I divide the sum by the number of rows.
#repeat this process for the rest of the code and but change the collumns
awk 'BEGIN{ FS="\t";NR >1} {sum += 1} END { if (NR > 0) print sum; }' $temp_file
echo "    Avg. HP: "
awk 'BEGIN{ FS="\t";NR > 1} {sum += $5} END { if (NR > 0) print sum / NR-1; }' $temp_file
echo "    Avg. Attack: "
awk 'BEGIN{ FS="\t";NR >1} {sum += $6} END { if (NR > 0) print sum / NR-1; }' $temp_file
echo "===== END SUMMARY ====="
#Delete temp value
rm -rf $temp_file
