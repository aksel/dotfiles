#!/bin/sh

weather=$(curl -s wttr.in?format=%c+%t,+)
time=$(date '+%d. %b %H:%M')

echo "$weather$time"
