dir=`pwd`



for i in `seq 1.0 0.1 2.0`
do
cd $dir/$i
ep=`grep E_p OSZICAR | tail -1 |awk '{print $3}'`
e=`grep entropy= OUTCAR | awk '{print $4}'`
echo $i $ep $e>> $dir/datae
done

