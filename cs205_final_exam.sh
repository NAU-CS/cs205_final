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
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

# shebang
#!/bin/awk -f
# being the program
BEGIN {
# defining variables
      file_name="";
      column_1_num_PKM="$1";
      column_6_HP="$6";
      column_7_ATK="$7";
}
{ 
# counters
      lines_num=0;
      total_num=0;
}
{
# increase number of lines in file
      lines_num++;
# increase total size
      total_num+=column_1_num_PKM;
}
{
# find the mean of HP
# set another counter
      lines_HP=0;
      total_HP=0;
}
{ 
# add number of hp in column 6 to total_HP
      lines_HP++;
      total_HP+=column_6_HP;
# divide total_HP by total_num
      column_6_HP=total_HP/total_num;
}
{
# find mean of attack
{ 
  # counter time
       lines_atk=0;
       total_atk=0;
}
{
   # add number of atk in column 7 to total_atk
        lines_atk++;
        total_atk+=column_7_ATK;
   # divide total_atk by total_num
        column_7_ATK=total_atk/total_num
}
END {
# output the information
      print "===== SUMMARY OF DATA FILE ====="
      print "   File name: " file_name
      print "   Total Pokemon: " total_num
      print "   Avg. HP: " total_HP
      print "   Avg. Attack: " total_ATK
      print "===== END SUMMARY ====="
}
