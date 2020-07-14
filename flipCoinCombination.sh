#!/bin/bash
declare -A dict
dict=(["H"]=0 ["T"]=0)
flipcoin=$(( RANDOM%2 ))
if [ $flipcoin -eq 0 ]
then
	key="T"
else
	key="H"
fi


