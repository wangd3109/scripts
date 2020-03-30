#!/bin/bash
fermi=$(awk 'NR==6{print $4}' DOSCAR)
nedos=$(awk 'NR==6{print $3}' DOSCAR)
natom=$(awk 'NR==1{print $1}' DOSCAR)

for i in `seq 0 1 $natom`
do
	let "a=6+($i*($nedos+1))"
	let "b=6+$nedos+$i*($nedos+1)"
echo  $i $a $b
sed -n "$a,$b p" DOSCAR >0DOS$i		# 截取指定行
sed  '1d' 0DOS$i >1DOS$i 		# delete the first line
done
awk -v f="$fermi" '{print $1-f}' 1DOS0 >e


#read -p "lm-decomposed or not:" answer
for i in `seq 0 1 $natom`
do
awk '{$1="";print $0}' 1DOS$i >2DOS$i	# 删除首列

paste e  2DOS$i > nDOS$i

done
rm 0DOS* 1DOS*  2DOS* ntDOS*

