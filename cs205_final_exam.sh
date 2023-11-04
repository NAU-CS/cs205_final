NR>1{hpsum+=$6;} # Gets the sum of all HP values.
NR>1{atksum+=$7;} # Gets the sum of all ATK values.
END{print "File name: ", FILENAME;} # Prints the name of the file being observed with AWK.
END{print "Total Pokemon: ", NR-1;} # Prints the total number of rows minus 1; this is equivalent to the pokemon amount.
END{print "Avg. HP: ", hpsum/(NR-1);} # Gets the mean HP value of all pokemon by dividing the HP sum by total pokemon.
END{print "Avg. Attack: ", atksum/(NR-1);} # Gets the mean ATK value of all pokemon by dividing the ATK sum by total pokemon.