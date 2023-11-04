if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

total_pokemon=$(awk 'NR>1 {print}' "$filename" | wc -l)
avg_hp=$(awk 'NR>1 {sum+=$5} END {print sum/NR}' "$filename")
avg_attack=$(awk 'NR>1 {sum+=$6} END {print sum/NR}' "$filename")

echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $filename"
echo "   Total Pokemon: $total_pokemon"
echo "   Avg. HP: $avg_hp"
echo "   Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="
