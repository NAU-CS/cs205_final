#! /usr/bin/awk -f
BEGIN {
#save name of of the target file
filename = ARGV[1]
}

{
# total hp of all targets
if (NR > 1) HPsum += $6

# total atk of all targets
if (NR > 1) ATKsum += $7

# total number of targets in target document
numTar = NR -1
}

END {
 print "===== SUMMARY OF DATA FILE ====="
 print "   File name: ", filename
 print "   Total Pokemon: ", numPokemon
 print "   Avg. Attack: ", ATKsum / numTar
 print "   Avg. HP: ", HPsum / numTar
 print "===== END SUMMARY ====="
}
