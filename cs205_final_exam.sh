#!/bin/bash

echo "        ===== SUMMARY OF DATA FILE ====="
BEGIN {sum =0} {sum+=$6} {sum2 =0} {sum2+=$7}
FILE=$1 
      {print "   File name: " } {print "pokemon.dat" } 
      {print "   Total Pokemon: " } {print wc -l}
      {print "   Avg. HP: " } {print sum/NR}
      {print "   Avg. Attack: " } {print sum2/ NR}
END   {print "===== END SUMMARY =====" }


