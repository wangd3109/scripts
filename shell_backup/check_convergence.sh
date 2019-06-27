#!bin/bash
dir=`pwd`

for i in `seq 1 1 20` `seq 0.1 0.1 2` `seq 30 10 200` 
do
cd $dir/$i
	a=$(tail -4 slurm*| head -n 1 | awk '{print $2}')
	echo $i $a >> $dir/data
done

