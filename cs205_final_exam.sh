
#!/bin/bash
# get the input file name
input_file="$1"
#pull the data from the file
awk -F'\t' 'NR>1 {
    # Count all pokemon and the data requested
    total_pokemon++
    total_hp += $6
    total_attack += $7

} END {
    # Calculate averages by dividing the number of pokemon by the total hp and then attack
    avg_hp = total_hp / total_pokemon
    avg_attack = total_attack / total_pokemon

    # display the data found in the file
    printf "\n===== SUMMARY OF DATA FILE =====\n"
    printf "File name: %s\n", "'$input_file'"
    printf "Total Pokemon: %d\n", total_pokemon
    printf "Avg. HP: %.4f\n", avg_hp
    printf "Avg. Attack: %.4f\n", avg_attack
    printf "\n===== END SUMMARY =====\n"
}' "$input_file"
