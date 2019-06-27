#!bin/bash
dir=`pwd`

for i in `seq 6.0 0.01 7.0`
do
	cd $dir/$i
	a=$(tail -3 out* | head -n 1 | awk '{print $2}')
	echo $i $a >> ../data
done

cd $dir
awk '/ 60/{print $0}' data >> data2

mv data2 data

