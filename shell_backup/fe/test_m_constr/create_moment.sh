#!/bin/bash
### 该脚本用来建立fcc Fe中的spin spiral结构（q1），seq 0 108 972, size=1.4678
### 对于q2，seq 0 36 324, size=1.1103

pi=3.1415926532
declare -i cont
cont=0
size=1.618
z=0

for i in `seq 0 108 972`
do
	  cont+=1
#	  echo "layer:", $cont, "angle:" $i 
	  angle=`echo | awk '{print ('$i'/360)*2*'$pi'}'`
	  x=`echo | awk '{print '$size'*cos('$angle')}'`
	  y=`echo | awk '{print '$size'*sin('$angle')}'`
#	  echo "layer:", $cont, "angle(degree):" $i,"angle(pi):"$angle,"x:" $x "y:" $y "z:" $z
#	  echo $x $y $z $x $y $z -$x -$y -$z -$x -$y -$z '\'
#	  echo  $x $y $z $x $y $z $x $y $z $x $y $z $x $y $z $x $y $z $x $y $z $x $y $z '\'
	  echo $x $y $z $x $y $z '\'
#	  echo $x $y $z $x $y $z $x $y $z $x $y $z -$x -$y -$z  -$x -$y -$z  -$x -$y -$z  -$x -$y -$z '\' 
done
