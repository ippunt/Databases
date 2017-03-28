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
echo "|"fieldone" decimal(8,2) default null, fieldtwo char(15) default null                                      | "
echo "|                                                                                                          | "
echo "|Pease place all of your fields together on one continued line, seperating each of the fields by a comma   | "
echo "|__________________________________________________________________________________________________________| "
echo -n "Would you like to see a full list of FieldType usage? y or n-->"
read answer
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
