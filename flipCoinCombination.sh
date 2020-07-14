#!/bin/bash
declare -A dict
dict=(["H"]=0 ["T"]=0)
read -p "Enter number of times to flip coin:" n
for (( i=1;i<=$n;i++ ))
do
        flipcoin=$(( RANDOM%2 ))
        if [ $flipcoin -eq 0 ]
        then
                key="T"
        else
                key="H"
        fi
        dict[$key]=$(( ${dict[$key]}+1 ))
done
for index in  ${!dict[@]}
do
        echo "Number of times $index appears is "${dict[$index]}
        percent=`echo ${dict[$index]} $n | awk '{print $1/$2}'`
        percentile=`echo $percent 100 | awk '{print $1*$2}'`
        echo "percentage of $index is "$percentile
done


