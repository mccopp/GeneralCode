#!/usr/bin/sh

currenttime=$(date +%H:%M)
echo "Start Program at $currenttime"

#Run every 15 mins until 18:45
if [[  "$currenttime" > "10:55" && "$currenttime" < "11:05"]]; then
for x in {1..32}
do

#customize what you want your shell script to do here
 #1: Run SAS program
 now=$(date +%Y.%m.%d_%H.%M.%S)
 pgmname="/<<insert path and name of SAS program>>/"
 logname="/<<insert path and name of log file>>_$now.log"
 /sas/SASHome/SASFoundation/9.4/sas $pgmname -log $logname
 #2: Run additional shell scripts
 "/<<insert path of shell scripts if any>>"
 
 #end customization
 
 sleep 15m
 done
else
 echo "Do not run as the current time is different from the planned CNTRL-M schedule"
fi