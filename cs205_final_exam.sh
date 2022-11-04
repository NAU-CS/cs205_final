# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format 
(where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

import sys

main ():
    fileobj=open(sys.argv[1])
    lines=[]
    new_lines=[]

    avg_hp = 0
    avg_attack = 0

    for line in fileobj:
        lines.append(line.strip().split('\t'))

    for pokemon in range (1, len(lines)):
        hp = int(lines[pokemon][4])
        attack = int(lines[pokemon][6])
        avg_hp += hp
        avg_attack += attack
        
    print ("filename: ", fileobj)
    print ("Total Pokemon :", lines[-1][0])
    print ("Average HP:", int(avg_hp/(len(lines))))
    print ("Avg Attack:", int(avg_attack/(len(lines))))

    fileobj.close()

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
