#!/bin/sh

if test $1  = "--help"
then
	echo help weather message
	exit
fi

interval=`grep -o 'interval[ ]*=[ ]*[0-9]*\.\?[0-9]*' weather.ini | grep -o '[0-9]*\.\?[0-9]*'`
while true
do
	wget meteoprog.by/ru/weather/minsk -T 1 -t 3 -q -O helpfile
	result=`grep -o 'property="og:description" content=".*"' helpfile| grep -o 'content=".*"'| grep -o '".*"' | grep -o '[^"]*'`
	rm helpfile
	if test "$result" = ""
	then
		echo "No internet"
		break
	fi
	echo $result	
	sleep $interval
done
