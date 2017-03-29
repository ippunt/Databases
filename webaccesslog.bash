#!/bin/bash
(
cat /home/access_log
xzcat /home/access_log-20160917.xz
xzcat /home/access_log-20161005.xz
) | awk '{ print $1 }' | sort | uniq -u >> ~/acessfin
lst=$(cat ~/accessfin)
for x in $lst
do echo -n $x >> ~/location.log
curl http://ipinfo.io/$x/loc >> ~/location.log
done
#gather all the ip addresses that have accessed website get detailed information regaurding location
#echo -n was due to needing the file to be formatted in a perticular way