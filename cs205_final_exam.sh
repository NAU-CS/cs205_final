#!/bin/awk -f


# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):

# ===== SUMMARY OF DATA FILE =====

#    File name: [VALUE]

#    Total Pokemon: [VALUE]

#    Avg. HP: [VALUE]

#    Avg. Attack: [VALUE]

# ===== END SUMMARY =====


# The "Avg." values should be calculated as mean values for the corresponding columns.

# The spacing and header formatting should match the above formatting description exactly.

# There should be a comment explaining the purpose of each line in your shell script. 

# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is forma




BEGIN{

# -1 becuase of first line

pokemon_in_file = -1 

# set health = zero

health = 0 

# set attack = 0

attack = 0 

#get filename

filename = $(basename "$0")

#set health_avrage

health_avrage = 0

#set attack_average

attack_average = 0

}

{



#add one to pokemon number

pokemon_in_file= pokemon_in_file + 1




#if number is real number at $5

if ($5 % 2 == 0  $5 % 2 == 1){

    #add the 5th row to health

    health += $5

    #add the 6th row to attack

    attack += $6

   }

	

#if number is real number at $6

else if ($6 % 2 == 0  $6 % 2 == 1){
    #add the 6th row to health

    health += $6

    #add the 7th row to attack

    attack += $7

   }

#else

else if ($7 % 2==0 || $7 % 2 ==1){

    #add the 7th row to health

    health += $7

    #add the 8th row to attack

    attack += $8

   }


}

END{


#find health avrage 

health_avrage = health / pokemon_in_file

attack_average = attack /  pokemon_in_file



#print output of the file

print "===== SUMMARY OF DATA FILE ====="

print "   File name:" filename

print "   Total Pokemon:" pokemon_in_file

print "   Avg. HP:" health_avrage

print "   Avg. Attack:" attack_average

print "===== END SUMMARY ====="
}




