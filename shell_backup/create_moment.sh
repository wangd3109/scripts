#!/bin/bash
### 该脚本用来建立fcc Fe中的spin spiral结构（q1）

pi=3.1415926532
declare -i cont
cont=0
size=1.458

for i in `seq 0 108 1080`
do
	  cont+=1
#	  echo "layer:", $cont, "angle:" $i 
	  angle=`echo | awk '{print ('$i'/360)*2*'$pi'}'`
	  x=`echo | awk '{print '$size'*cos('$angle')}'`
	  y=`echo | awk '{print '$size'*sin('$angle')}'`
	  echo "layer:", $cont, "angle(degree):" $i,"angle(pi):"$angle,"x:" $x "y:" $y
done
