#!/bin/bash
#用来检查constrained magnetic moment时，RWIGS参数对磁矩的影响
#比较OSZICAR中M_int和OUTCAR中磁矩的区别

dir=`pwd`

for i in `seq 1 1 20` `seq 0.1 0.1 2` `seq 30 10 200` 
do 
cd $dir/$i
grep -n E_p OSZICAR | tail -2| head -1 |awk '{print $1}' > tmp
sed -i 's/://g' tmp
n=`awk '{print $1}' tmp`
let n1=n+4
let n2=n+5
#echo $n1 $n2
#sed -n ''$n1' p' 
m1=`sed -n ''$n1' p'  OSZICAR | awk '{print $5,$6,$7}'`
m2=`sed -n ''$n2' p' OSZICAR | awk '{print $5,$6,$7}'`

grep -n magnetization OUTCAR | tail -3 |head -1| awk '{print $1}' > tmp2
sed -i 's/://g' tmp2
n01=`awk '{print $1}' tmp2`
#echo $n01
let n1x=$n01+4
let n2x=$n01+5
let n1y=$n1x+11
let n2y=$n1y+1
let n1z=$n1y+11
let n2z=$n1z+1

#echo $n1x $n1y $n1z
#echo $n2x $n2y $n2z

m1x=`sed -n ''$n1x' p' OUTCAR | awk '{print $5}'`
m1y=`sed -n ''$n1y' p' OUTCAR | awk '{print $5}'`
m1z=`sed -n ''$n1z' p' OUTCAR | awk '{print $5}'`
m2x=`sed -n ''$n2x' p' OUTCAR | awk '{print $5}'`
m2y=`sed -n ''$n2y' p' OUTCAR | awk '{print $5}'`
m2z=`sed -n ''$n2z' p' OUTCAR | awk '{print $5}'`

echo $n1x $n1y $n1z
echo $m1x $m1y $m1z
#echo $m2x $m2y $m2z


#n01
#n02

echo -e "$i \n $m1 \n $m2" >> ../data_m
#echo -e "out $m1x $m1y $m1z \nout $m2x $m2y $m2z" >> ../data_m

done
