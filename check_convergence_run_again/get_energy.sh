#!/bin/bash

dir=`pwd`

for i in `seq 6 0.01 7`
do
	cd $dir/$i
	e=`grep entropy= OUTCAR | awk '{print $4}'`
	echo $i $e >> $dir/energy
done

