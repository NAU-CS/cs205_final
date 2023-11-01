#!/bin/awk -f

	#FS="\t" makes the field seperator a tab. Then I use set the column equal to the description to make sure it adds up the correct columns
#
	BEGIN { FS="\t"; $6 ~ /HP/; $7 ~ /Attack/; }

	#I create new variables and set them equal to the sum of the columns needed
	#
		{ HPtotal+=$6; Attacktotal+=$7; }

	#I then print the file simply using FILENAME, use NR to count the line numbers to know how many pokemon there are. Then call back to the variables I created that hold the total values, then divided by the total number of lines to get the averages.
		#
	END { print "File Name: " FILENAME; 
	      print "Total Pokemon: " NR; 
	      print "Avg. HP: " HPtotal/NR; 
    	      print "Avg. Attack: " Attacktotal/NR; }	
