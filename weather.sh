#!/bin/sh
wget --quiet meteoprog.by/ru/weather/minsk  -O -|grep 'property="og:description" content=".*"' | grep -o 'content=".*"'| grep -o '".*"' | grep -o '[^"]*'