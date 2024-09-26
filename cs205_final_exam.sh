# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====


COUNT=$(awk -F "\t" "{if (NR != 1) {print \$2}}" $1 | sort | uniq | wc -l) # prints all data

echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $1" # prints name
echo "   Total Pokemon: $COUNT" # print count
echo "   Avg. HP: $(awk -F "\t" "{if (NR != 1) {hp += \$5}} END {print hp / $COUNT}" $1)" # 
echo "   Avg. Attack: $(awk -F "\t" "{if (NR != 1) {attack += \$6}} END {print attack / $COUNT}" $1)" 
