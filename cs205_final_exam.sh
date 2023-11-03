#!/bin/awk -f
#shebang to ensure the code is executed 
BEGIN {
#Beginning of the awk script
	total_HP = 0;
#Variable to store total HP
	total_attack = 0;
#Variable to store total attack points
	lines = 0;
#Variable to store total lines
	line_number = 0
#Variable to keep track of the line number
	PROGNAME = "$(basename "$0")"
#Variable to store the name of the file
}
{
#Increases the line number count
	line_number ++;
#If statement to make sure the first line isn't included
	if (line_number > 0) {
#Increases total HP by the value in its respective column
		total_HP += $6;
#Increases total attack points by the value in its respective column
		total_attack += $7;
#Increases number of total lines
		lines ++;
	}
}
END {
#Closing part of the script
	print "===== SUMMARY OF DATA FILE ====="
#Prints header 
	print "\tFile name: ", $PROGNAME;
#Prints file name
	print "\tTotal pokemon: ", lines;
#Prints total pokemon as determined by number of lines in the file
	mean_HP = total_HP/lines;
#Calculates average health points of pokemon
	print "\tAvg. HP: ", mean_HP;
#Prints average HP
	mean_attack = total_attack/lines;
#Calculates average attack points
	print "\tAvg. attack: ", mean_attack;	
#Prints average attack points
	print "===== END SUMMARY ====="
#Prints closing statement
}



