#!/bin/bash
echo "What would you like your Database to be called?"
echo -n "remember to use the .sqlite after the name so we know what it is-->"
read dbname

echo -n "What would you like your first table to be called?"
read tablename

echo "___________________________________________________________________________________________________________  "
echo "|Now you need to fill in all your field data, it will be 3 parts                                           | "
echo "|                                                                                                          | "
echo "|Your FieldName FieldType Null or not examples follow                                                      | "
echo "|                                                                                                          | "
echo "|fieldone decimal(8,2) default null, fieldtwo char(15) default null                                        | "
echo "|                                                                                                          | "
echo "|Pease place all of your fields together on one continued line, seperating each of the fields by a comma   | "
echo "|__________________________________________________________________________________________________________| "
echo -n "Would you like to see a full list of FieldType usage? y or n-->"
read answer
#to use this basically google field types and put useful fieldtype data into a fieldtype file in the same directory
if [ $answer = "y" -o $answer = "Y" ]
then
cat fieldtype
elif [ $answer = "n" -o $answer = "N" ]
then
echo "Back to your database creation"
fi
echo -n " Now that you are learned or ready, please give me your field data for the database----->"
read fielddata

echo $dbname
echo $tablename
echo $fielddata

echo "create table $tablename ($fielddata);" | sqlite3 $dbname
sleep 2
echo ".table" | sqlite3 $dbname
echo "Database Complete!"
sleep 2
echo "Would you like to add rows into your new Database? y or n --->"
read rows
if [ $rows = "n" -o $rows = "N" ]
exit
elif [ $rows = "y" -o $rows = "Y" ]
then
echo -n "How many rows would you like to add into this database?"
read z
fi
echo "Please give me just the names of the fields you want to add data into seperated by a comma"
echo -n "Right here please---->"
read fieldnames


while [ $z -gt "0" ]
do
echo "Please give me your information only, and make sure it is seperated by commas."
sleep 1
echo "Like this:\"Mike\",\"Julie\"          Please make sure they are wrapped in quotation marks and seperated by a comma"
sleep 1
echo -n "Right about here----->:"
read info
echo "insert into $tablename ($fieldnames) values ($info);" | sqlite3 $dbname
z=$((z-1))
done
