#!/bin/bash
declare -A dict
declare -A dict1
declare -A dict2
dict=(["H"]=0 ["T"]=0)
dict1=(["HH"]=0 ["TT"]=0 ["TH"]=0 ["HT"]=0)
dict2=(["TTT"]=0 ["TTH"]=0 ["THT"]=0 ["THH"]=0 ["HTT"]=0 ["HTH"]=0 ["HHT"]=0 ["HHH"]=0)
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
	key1=""
	for(( j=1;j<=2;j++ ))
	do
		flipcoin1=$(( RANDOM%2 ))
		if [ $flipcoin1 -eq 0 ]
		then
			key1=$key1"T"
		else
			key1=$key1"H"
		fi
	done
        dict1[$key1]=$(( ${dict1[$key1]}+1 ))
	key2=""
        for(( j=1;j<=3;j++ ))
        do
                flip2=$(( RANDOM%2 ))
                if [ $flip2 -eq 0 ]
                then
                        key2=$key2"T"
                else
                        key2=$key2"H"
                fi
        done
        dict2[$key2]=$(( ${dict2[$key2]}+1 ))
done
max=0
echo "Singlet combination:"
for index in  ${!dict[@]}
do
        echo "Number of times $index appears is "${dict[$index]}
        percent=`echo ${dict[$index]} $n | awk '{print $1/$2}'`
        percentile=`echo $percent 100 | awk '{print $1*$2}'`
        echo "The percentage of $index is "$percentile
	if [ $max -eq 0 ]
	then
		max=${dict[$index]}
		combination=$index
	elif [ ${dict[$index]} -gt $max ]
	then
		 max=${dict[$index]}
		combination=$index
	fi
done
echo "Doublet combination:"
for index in  ${!dict1[@]}
do
        echo "Number of times $index appears is "${dict1[$index]}
        percent=`echo ${dict1[$index]} $n | awk '{print $1/$2}'`
        percentile=`echo $percent 100 | awk '{print $1*$2}'`
        echo "The percentage of $index is "$percentile
	if [ ${dict1[$index]} -gt $max ]
        then
                max=${dict[$index]}
                combination=$index
        fi
done
echo "Triplet combination:"
for index in  ${!dict2[@]}
do
        echo "Number of ti	mes $index appears is "${dict2[$index]}
        percent=`echo ${dict2[$index]} $n | awk '{print $1/$2}'`
        percentile=`echo $percent 100 | awk '{print $1*$2}'`
        echo "The percentage of $index is "$percentile
	if [ ${dict2[$index]} -gt $max ]
        then
                max=${dict2[$index]}
                combination=$index
        fi
done
echo "The winning combination is "$combination

