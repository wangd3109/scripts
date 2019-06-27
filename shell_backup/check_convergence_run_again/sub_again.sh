#!/bin/bash
dir=`pwd`

lines=`wc data | awk '{print $1}'`

for i in `seq 1 1 $lines`
do
	cd $dir
	file=`sed -n "$i p" data| awk '{print $1}'`
	echo $i $file
#	file=`awk '{print $1}' data`
#	file=6.01
	cd $file
	echo NELM=200 >> INCAR
	rm out*
	sbatch job.sh
done

