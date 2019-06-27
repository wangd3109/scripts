dir=`pwd`

for i in `seq 1 1 20` `seq 0.1 0.1 2` `seq 30 10 200` 
do
cd $dir/$i
ep=`grep E_p OSZICAR | tail -1 |awk '{print $3}'`
e=`grep entropy= OUTCAR | awk '{print $4}'`
echo $i $ep $e>> ../data_ep
done
