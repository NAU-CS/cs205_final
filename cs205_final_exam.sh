if [ $# -ne 1]; then
	echo "Usage: $0 <data_file>"
	exit 1
fi

file_name="$1"

avg_hp=$(awk '{ sum += $5 } END { if (NR > 0) print sum / NR }' "$file_name")
avg_attack=$(awk '{ sum += $6 } END { if (NR > 0) print sum / NR }' "$file_name")
total_pokemon=$(awk 'NR > 1 { count++ } END { print count }' "$file_name")

echo "==== SUMMARY OF DATA FILE ===="
echo "File name: $file_name"
echo "Total Pokemon: $total_pokemon"
echo "Avg. HP: $avg_hp"
echo "AVG. Attack: $avg_attack"
echo "==== END SUMMARY ===="
