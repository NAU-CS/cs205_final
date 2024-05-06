#!/bin/bash

# File paths
POKEMON_FILE="pokemon_data.csv"
OUTPUT_FILE="pokemon_stats.txt"
SCREENSHOT_DIR="screenshots"

# Function to calculate average
calculate_average() {
    sum=0
    count=0
    while IFS=, read -r id name type attack hp; do
        ((sum += attack + hp))
        ((count++))
    done < "$POKEMON_FILE"
    average=$((sum / count))
    echo "Total number of Pokémon: $count" > "$OUTPUT_FILE"
    echo "Average attack: $((average / 2))" >> "$OUTPUT_FILE"  # Divide by 2 for attack
    echo "Average HP: $((average / 2))" >> "$OUTPUT_FILE"  # Divide by 2 for HP
}

# Main script logic
echo "Calculating Pokémon statistics..."

# Check if Pokémon data file exists
if [ -f "$POKEMON_FILE" ]; then
    echo "Pokémon data file found."
    # Call function to calculate averages
    calculate_average
else
    echo "Error: Pokémon data file not found."
    exit 1
fi

echo "Pokémon statistics calculated."
