#!/usr/local/bin/bash
  
#start of with empty cleaned file
>cleaned.txt

#get rid of first line and location parts that are unecessary
sed '1d' forecast_data.csv |  while read line; do echo ${line:31:${#line}} >> cleaned.txt; done

#declare dictionary of forecasts
declare -A forecasts

#add dictionary values for each day
while read line; do IFS=',' read -a daily <<< "$line"; forecasts[${daily[0]}]="Temperature is ${daily[1]} and it will be ${daily[-1]}"; done < "cleaned.txt"

#print out forecast for date
x=$(<date.txt)
echo ${forecasts[$x]}
