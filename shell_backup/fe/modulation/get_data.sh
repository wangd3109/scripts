#!/bin/bash
#用于收集modulation的数据

dir=`pwd`

for i in `seq 0 1 30` total
do
cd $dir/$i
        e=`grep entropy= OUTCAR | awk '{print $4}'`
        m=`grep F= OSZICAR | awk '{print $10, $11, $12}'`
echo -e "$i \t $e \t $m" >> $dir/data
done

