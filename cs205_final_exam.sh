#! /usr/bin/awk -f
#This is a shebang that allows us to use an awk script
# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

#The value starts at 0 when the script begins
BEGIN{VALUE = 0}
#Every line in the file will increase value by one
{VALUE++}
#HP is set to HP plus the HP in the current line located in column 6
{HP=HP+$6}
#ATK is set to ATK plus the ATK in the current line located in column 7
{ATK=ATK+$7}
END{

#printing the summary line
print "===== SUMMARY OF DATA FILE ====="
#printing file name
print "File Name: " FILENAME
#printing number of pokemon
print "Total Pokemon: " VALUE
#printing HP
print "Avg. HP: " HP/VALUE
#printing Attack
print "AVG. Attack: " ATK/VALUE
#printing end line
print "===== END SUMMARY ====="
}

