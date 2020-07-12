#!/bin/bash -x
echo "Combination of Singlet, Doublet and Triplet"
declare -A flipCoin
echo "enter the number of fliptimes"
read fliptime
tosscount=1;
headsCount=0
tailsCount=0
while [[ $tosscount -le $fliptime ]]
do
	flipcoin=$((RANDOM%2))
	if [[ $flipcoin -eq 1 ]]
	then
		flipCoin[$tosscount]="H"
		((headsCount++))
	else
		flipCoin[$tosscount]="T"
		((tailsCount++))
	fi
	((tosscount++))
done
perH=`echo $headsCount $fliptime | awk -F " " '{a=$1;b=$2;res1=(a/b*100);print res1}'`
echo "HEAD percentage Combination "$perH
perT=`echo $tailsCount $fliptime | awk -F " " '{a=$1;b=$2;res1=(a/b*100);print res1}'`
echo "TAIL percentage Combination "$perT
echo ${flipCoin[@]}
echo ${!flipCoin[@]}
