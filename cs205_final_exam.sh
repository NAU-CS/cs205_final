#!/bin/sh
awk '
END{ 
print "===== SUMMARY OF DATA FILE =====";
print "File name: ", FILENAME;
print "Total Pokemon: ", NR;
print "Avg. HP: ";
print "Avg. Attack: ";
print "===== END SUMMARY =====";
}' $1 # This records the second input from the command line into FILENAME

