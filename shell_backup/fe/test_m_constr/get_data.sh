dir=`pwd`

for i in `seq 1.0 0.1 2.0` 
do
cd $dir/$i
        e=`grep entropy= OUTCAR | awk '{print $4}'`
        m=`grep F= OSZICAR | awk '{print $10, $11, $12}'`
echo $i $e $m >> $dir/data
done
