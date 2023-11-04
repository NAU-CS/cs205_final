# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# 
BEGIN{
FS="\t";
rows=0
hp=0
attack=0
}
{if (NR != 1){
rows +=1 ;
hp+= $6;
attack+=$7;
}}
END{
print"===== SUMMARY OF DATA FILE =====";
print"    File name:" FILENAME;
print"    Total Pokemon:" rows ;
print"    Avg. HP:" hp/rows;
print"    Avg. Attack:" attack/rows;
print "===== END SUMMARY =====";
}

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
