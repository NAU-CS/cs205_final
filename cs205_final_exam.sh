#!/bin/awk -f
BEGIN {
lines = 0;
hp_total = 0;
attack_total = 0;
}
{
lines++;
hp_total += "$3";
attack_total += "$4"
}
END {
print "==== SUMMARY OF DATA FILE ====";
print "File name: ", FILENAME;
print "Total Pokemon: ", lines;
print "Avg. HP: ", $hp_total / $lines;
print "Avg. Attack: " $attack_total / $lines;
print "==== END SUMMARY ====";
}
