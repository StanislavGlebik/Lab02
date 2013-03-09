#!/bin/sh

interval=`grep -o 'interval[ ]*=[ ]*[0-9]*\.\?[0-9]*' weather.ini | grep -o '[0-9]*\.\?[0-9]*'`
echo $interval
while true
do
	wget --quiet meteoprog.by/ru/weather/minsk  -O -|grep -o 'property="og:description" content=".*"' | grep -o 'content=".*"'| grep -o '".*"' | grep -o '[^"]*'
	sleep $interval
done
