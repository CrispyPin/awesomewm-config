#!/bin/sh
if [ $# -eq 0 ]; then
	day=$(date +"%j")
else
	day=$1
fi

juneday=$(( ($day + 365 - 151)%365 ))
#echo $day
echo $juneday
