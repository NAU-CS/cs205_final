# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
#!/bin/bash
FILE=$1
echo "File name: $FILE"
summary=$(awk '
    BEGIN {
             total = 0;
             hp_total = 0;
             atk_total = 0;
	     hp_mean = 0;
	     atk_mean = 0;
	     FS = "	";
          }
          {
	     total++;
	     hp_total += $6;
	     atk_total +=$7;
          }
          END {
	     total -=1;
	     print("Total Pokemon: ",total);
	     hp_mean = hp_total/total;
	     atk_mean = atk_total/total;
	     print("Avg. HP: ", hp_mean);
	     print("Avg Attack: ", atk_mean);
          }
' "$FILE")

echo "$summary"
