if [ $# -ne 1]; then
	echo "Usage: $0 <data_file>"
	exit 1
fi

file_name="$1"

avg_hp=$(awk '{ sum += $2 } END { if (NR > 0) print sum / NR }' "$file_name")
avg_attack=$(awk '{ sum += $3 } END { if (NR > 0) print sum / NR }' "$file_name")

echo "==== SUMMARY OF DATA FILE ===="
echo "File name: $file_name"
echo "Total Pokemon: $(wc - 1 < "$file_name")"
echo "Avg. HP: $avg_hp"
echo "AVG. Attack: $avg_attack"
echo "==== END SUMMARY ===="
