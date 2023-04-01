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


#I'm still unable to install git in virtual box. It says jj3571 (my username most places) is not in the list of sudoers. I could not find a way to fix this. I followed an online guide previously but it did not work, so instead I've been using VSCode. In an attempt to not cheat, I've also been using the terminal when possible to align with the intended Git usage. 

#!/usr/bin/awk -f

BEGIN {
FS="\t"
}

{
count++
sum+=$2
sum1+=$6/NR
sum2+=$7/NR 
}
    
END {
print "File Name: "FILENAME
print "Total pokemon: "count
print "Avg. HP: "sum1
print "Avg. Attack: "sum2
}