#!/bin/bash
#welcome message
echo "Tossing coin winning percentage and probabilities are done in this program"

echo "Enter the number of desired coin combination"
echo "1)Signlet" 
echo "2)Double" 
echo "3)Triple" 
read option
case $option in
1)
singlet=([H]=0 [T]=0)
declare -A coin
for i in $(seq 1 50)
do
flip1=$((RANDOM%2))
if [[ $flip1 == 1 ]]
then
        coin[$i]="Head"
        ((Head++))
else
        coin[$i]="Tail"
        ((Tail++))
fi
done
H=`expr $H \* 100 / 50 `
echo "H : $H % "
T=`expr $T \* 100 / 50`
echo "T : $T %"
declare -A coin
coin=([H]=$H [T]=$T)
count=0
for i in ${!coin[@]}
do
        (( $i > count || count == 0 ))&& count=$i
done
echo "The winning probability :"
echo "$count : ${coin[$count]} percentage%"
;;
2)
doublet=([HH]=0 [HT]=0 [TH]=0 [TT]=0)
declare -A coin
for i in $(seq 1 50)
do
flip1=$((RANDOM%2))
flip2=$((RANDOM%2))
if [[ $flip1 == 1 && $flip2 == 1 ]]
then
        coin[$i]="HH"
        ((HH++))
elif [[ $flip1 == 1 && $flip2 == 0 ]]
then
        coin[$i]="HT"
        ((HT++))
elif [[ $flip1 == 0 && $flip2 == 1 ]]
then
        coin[$i]="TH"
        ((TH++))
else
        coin[$i]="TT"
        ((TT++))
fi
done
HH=`expr $HH \* 100 / 50 `
echo "HH : $HH % "
HT=`expr $HT \* 100 / 50`
echo "HT : $HT %"
TH=`expr $TH \* 100 / 50 `
echo "TH : $TH % "
TT=`expr $TT \* 100 / 50`
echo "TT : $TT %"
declare -A Dict1
doublet=([HH]=$HH [HT]=$HT [TH]=$TH [TT]=$TT)
max=0
for i in ${!doublet[@]}
do
        (( $i > count || count == 0 ))&& count=$i
done
echo "The winning combinatioon :"
echo "$count : ${doublet[$count]} percentage %"
;;
3)
triplet=([HHH]=0 [HHT]=0 [HTH]=0 [THH]=0 [TTH]=0 [THT]=0 [HTT]=0 [TTT]=0)
declare -A coin
for i in $(seq 1 50)
do
flip1=$((RANDOM%2))
flip2=$((RANDOM%2))
flip3=$((RANDOM%2))
if [[ $flip1 == 1 && $flip2 == 1 && $flip3 == 1 ]]
then
	coin[$i]="HHH"
	((HHH++))
elif [[ $flip1 == 1 && $flip2 == 1 && $flip3 == 0 ]]
then
        coin[$i]="HHT"
        ((HHT++))
elif [[ $flip1 == 1 && $flip2 == 0 && $flip3 == 1 ]]
then
        coin[$i]="HTH"
        ((HTH++))
elif [[ $flip1 == 0 && $flip2 == 1 && $flip3 == 1 ]]
then
        coin[$i]="THH"
        ((THH++))
elif [[ $flip1 == 0 && $flip2 == 0 && $flip3 == 1 ]]
then
        coin[$i]="TTH"
        ((TTH++))
elif [[ $flip1 == 0 && $flip2 == 1 && $flip3 == 0 ]]
then
        coin[$i]="THT"
        ((THT++))
elif [[ $flip1 == 1 && $flip2 == 0 && $flip3 == 0 ]]
then
        coin[$i]="HTT"
        ((HTT++))
else
        coin[$i]="TTT"
        ((TTT++))
fi
done
HHH=`expr $HHH \* 100 / 50 `
echo "HHH : $HHH % "
HHT=`expr $HHT \* 100 / 50`
echo "HHT : $HHT %" 
HTH=`expr $HTH \* 100 / 50 `
echo "HTH : $HTH % "
THH=`expr $THH \* 100 / 50`
echo "THH : $THH %"
TTH=`expr $TTH \* 100 / 50`
echo "TTH : $TTH %"
THT=`expr $THT \* 100 / 50`
echo "THT : $THT %"
HTT=`expr $HTT \* 100 / 50`
echo "HTT : $HTT %"
TTT=`expr $TTT \* 100 / 50`
echo "TTT : $TTT %"
#echo ${coin[@]}
declare -A triplet
triplet=([HHH]=$HHH [HHT]=$HHT [HTH]=$HTH [THH]=$THH [TTH]=$TTH [THT]=$THT [HTT]=$HTT [TTT]=$TTT)
count=0
for i in ${!triplet[@]}
do
	(( $i > count || count == 0 ))&& count=$i
done
echo "The winning combinatioon :"
echo "$count : ${triplet[$count]} percentage%"
;;
*)
exit 1
;;
esac
