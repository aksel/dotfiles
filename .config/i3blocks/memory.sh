#!/bin/sh
total=$(vmstat -s | grep "total memory" | perl -pe 's/\D//g')
used=$(vmstat -s | grep "used memory" | perl -pe 's/\D//g')

echo "$total $used" | awk '{printf "%.2f%", $2/$1*100}' 

