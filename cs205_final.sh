#!/bin/bash

BEGIN{FS="\t"}
{
if (NR!=1){
	sum+=1

	hp+=$6

	attack+=$7

	}
}

END{
#show program title
print  "===== SUMMARY OF DATA FILE ====="
#display file name
print  "File name: " FILENAME
#display total pokemon
print "Total Pokemon: " sum
#display average HP
print  "Avg. HP: " (hp/sum)
#display avaergae attack
print  "Avg. Attack: " (attack/sum)
#end program
print  "===== END SUMMARY =====" 
}
