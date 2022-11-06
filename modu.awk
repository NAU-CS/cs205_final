
BEGIN{FS="\t"}
{

if (NR!=1){


hp += $6

att += $7

sum +=1


avg_hp = hp/sum
avg_att = att/sum

}
}

END{
print " ===== SUMMARY OF DATA FILE ====="
print "File name: ", FILENAME
print "Total Pokemon: " sum
print "Avg. HP: ", avg_hp
print "Avg. Attack: " avg_att
print " ===== END SUMMARY ====="
}