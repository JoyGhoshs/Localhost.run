#!/bin/bash
#Coded By Joy Ghosh
clear
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
green='\e[0;32m'
echo -e """ $yellow

█░░ █▀█ █▀▀ ▄▀█ █░░ █░█ █▀█ █▀ ▀█▀ ░ █▀█ █░█ █▄░█ 
$red█▄▄ █▄█ █▄▄ █▀█ █▄▄ █▀█ █▄█ ▄█ ░█░ ▄ █▀▄ █▄█ █░▀█ [JoyGhosh]
$white---------------------------------------------------------
| From http://localhost.run                             |
---------- Expose Localhost over Internet ---------------$red
"""
read -p "Enter Port Of Your Localhost--> " po
read -p "Enter an random-string for Generating Subdomains --> " sub
ok=200
resp=$(curl -s -o /dev/null -I -w "%{http_code}" localhost:$po)
echo "$yellow<-------------------------------------------------------------------->$white"
echo "Cheaking If LocalHost Is Running Or Not"
if [ $ok == $resp ]
then
echo -e "Localhost $green Running $white"
ssh -R 80:localhost:$po $sub@ssh.localhost.run
else
echo -e "Localhost $red Not Running $white start localhost service an execute script"
echo "exiting"
exit
fi


