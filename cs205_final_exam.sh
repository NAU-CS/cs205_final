echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: " $1;
total=$(echo | awk 'END{print NR}' $1)
echo "   Total Pokemon: " ${total};
hp=$(echo | awk '{total_hp += $6; row++} END {if(row>0) print total_hp/row;}' $1)
echo "   Avg. HP: " ${hp}
attack=$(echo | awk '{total_hp += $7; row++} END {if(row>0) print total_hp/row;}' $1)
echo "   Avg. Attack: " ${attack}
echo "===== END SUMMARY ====="
