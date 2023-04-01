# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ======= SUMMARY OF POKEMON.DAT ======
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ======= END SUMMARY =======

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script.
# The data file will be passed in to the script as a positional parameter and will not necessarily be
# called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
BEGIN {

	hpavg = 0.0       #Declare variable to hold HP total
	attackavg = 0.0   #Declare variable to hold Attack total

}

{
	hpavg += $6      #Running total of Field 6, the HP column
	attackavg += $7  #Running total of Field 7, the Attack column
	
}

END {

	datalines = int(NR-1)	#Subtract 1 from NR to account for first header line.

	printf("\n\t ======= SUMMARY OF POKEMON.DAT ===== \n")	#Print first line of the output
	printf("\t\t Total Pokemon: %d\n", datalines)   		#Total count of all records yields the total number of Pokemon
	printf("\t\t Avg. HP: %d\n", hpavg/datalines)			#Show total of HP divided by number of Pokemon
	printf("\t\t Avg. Attack: %d\n", attackavg/datalines)		#Show total of HP divided by number of Pokemon
	printf("\t ======= SUMMARY OF POKEMON.DAT ===== \n")	#Print final line of the output
	printf("\n")

}

