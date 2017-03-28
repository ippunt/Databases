#!/bin/bash
# bday
echo -n "Please enter your birthday in the following format 04/15/1986: "
read bday

echo -n "Can I please also have your first name?: "
read NM

# Gives me seconds away from 1970 from bday
away=$(date --date=$bday +%s)

#Gives me seconds from current time
total=$(date +%s)

#Gived me time seconds I have been alive
curr=$(($total - $away))

#Gives me minutes I have been alive
min=$(bc <<< "scale=4;$curr / 60")

#Gives me hours been alive
hour=$(bc <<< "scale=4;$min / 60")

#Gives me days I have been alive
days=$(bc <<< "scale=4;$curr / 86400")


#Gives me months I have been alive
months=$(bc <<< "scale=4;$days / 30.42")
#Gives me years I have been alive
years=$(bc <<< "$days / 365")
echo "I have been alive for $years years, $months months, $days days, $hour hours, $min minutes, $curr seconds "

echo " Your name and birth day are $NM, $bday"
# includes leapyear
leap=$((curr / 126144000))
#add leap year into days i have been alive
leapdays=$(bc <<< "$leap + $days")
echo "Days I have been alive with leapyear $leapdays"
#I would call this a dirty leap year because it can be one day off lets say someone is 3 and they already encoutered a leapyear the system will not actually count the leapyear until you hit 4 yours of time spanned. So at most it shows one less day.

#Lets see if i can get it all into sqlite
echo "insert into lab6x (ID,Name,Seconds,Minutes,Hours,Days,Dayswleap,Months,Years,Bday) values (null,'$NM','$curr','$min','$hour','$days','$leapdays','$months','$years','$bday');" | sqlite3 lab6.sqlite
