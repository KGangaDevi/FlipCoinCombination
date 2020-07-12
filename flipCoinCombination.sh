#!/bin/bash -x
echo "Combination of Singlet, Doublet and Triplet"
declare -A flipCoin
echo "enter the number of fliptimes"
read fliptime
tosscount=1;
headsCount=0
tailsCount=0
countHH=0;
countTT=0;
countHT=0;
countTH=0;
while [[ $tosscount -le $fliptime ]]
do
	rCheck=$((RANDOM%6))
	if [[ $rCheck -eq 1 ]]
	then
				flipCoin[$tosscount]="H"
				((headsCount++))
	elif [[ $rcheck -eq 0 ]]
	then
				flipCoin[$tosscount]="T"
				((tailsCount++))
	elif [[ $rcheck -eq 2 ]]
   then
                flipCoin[$tosscount]="HH"
                ((countHH++))
   elif [[ $rcheck -eq 3 ]]
   then
                flipCoin[$tosscount]="TT"
                ((countTT++))
   elif [[ $rcheck -eq 4 ]]
   then
                flipCoin[$tosscount]="HT"
                ((countHT++))
   elif [[ $rcheck -eq 5 ]]
   then
                flipCoin[$tosscount]="TH"
                ((countTH++))
	fi
	((tosscount++))
done
perH=`echo $headsCount $fliptime | awk -F " " '{a=$1;b=$2;res1=(a/b*100);print res1}'`
echo "HEAD percentage Combination "$perH
perT=`echo $tailsCount $fliptime | awk -F " " '{a=$1;b=$2;res1=(a/b*100);print res1}'`
echo "TAIL percentage Combination "$perT
perHH=`echo $countHH $fliptime | awk -F " " '{a=$1;b=$2;res1=(a/b*100);print res1}'`
echo "HEAD-HEAD Combination"$perHH
perTT=`echo $countTT $fliptime | awk -F " " '{a=$1;b=$2;res1=(a/b*100);print res1}'`
echo "TAIL-TAIL Combination"$perTT
perHT=`echo $countHT $fliptime | awk -F " " '{a=$1;b=$2;res1=(a/b*100);print res1}'`
echo "HEAD-TAIL Combination"$perHT
perTH=`echo $countTH $fliptime | awk -F " " '{a=$1;b=$2;res1=(a/b*100);print res1}'`
echo "TAIL-HEAD Combination"$perTH

echo ${flipCoin[@]}
echo ${!flipCoin[@]}
