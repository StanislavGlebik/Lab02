#!/bin/sh
wget --quiet meteoprog.by/ru/weather/minsk 
grep 'property="og:description" content=".*"' minsk| grep -o 'content=".*"'| grep -o '".*"' | grep -o '[^"]*'