#!/bin/bash
 
sqlite3 ipvisitors.sqlite << HEREDOC

create table if not exists "Visits"
 (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "ip" char(42) ,
  "country_code" char(2) ,

  "country_name" char(25) ,
  "region_code" char(10) ,
  "region_name" char(15) ,
  "city" char(15) ,

  "zip_code" char(10) ,
  "time_zone" char(20) ,
  "latitude" char(10) ,
  "longitude" char(10) ,
  "metro_code" char(5)
);

HEREDOC
#with the .import if there is no table it uses the first line for the field names, this sets that up.
echo "ip,country_code,country_name,region_code,region_name
,city,zip_code,time_zone,latitude,longitude,metro_code" > ~/output
lst=$(cat ~/log2) #log file of all the ip addresses
for x in $lst
do
curl freegeoip.net/csv/$x >> ~/output
done
cat ~/output | sed 's/,/|/g' >> ~/output1.sqlite
echo ".import /home/jdarling2/output1.sqlite TMPVisits" | sqlite3 ipvisitors.sqlite

echo "insert into Visits (ip, country_code, country_name, region_code, region_name,city, zip_code, time_zone,
 latitude, longitude, metro_code) select ip, country_code, country_name, region_code, region_name, city, zip_code,time_zone,
 latitude, longitude, metro_code from TMPVisits;" | sqlite3 ipvisitors.sqlite



