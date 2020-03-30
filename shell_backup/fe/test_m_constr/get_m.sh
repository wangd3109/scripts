#!/bin/bash
#用来检查constrained magnetic moment时，RWIGS参数对磁矩的影响
#比较OSZICAR中M_int和OUTCAR中磁矩的区别

dir=`pwd`

for j in `seq  0.5 0.1 1.5`
do
cd $dir/$j
grep -n E_p OSZICAR | tail -2| head -1 |awk '{print $1}' > tmp
sed -i 's/://g' tmp
n=`awk '{print $1}' tmp`
let n1=n+4
let n2=n+5
let n3=n+6
let n4=n+7
let n5=n+8
let n6=n+9
let n7=n+10
let n8=n+11
let n9=n+12
let n10=n+13
let n11=n+14
let n12=n+15
let n13=n+16
let n14=n+17
let n15=n+18
let n16=n+19
let n17=n+20
let n18=n+21
let n19=n+22
let n20=n+23
#echo $n1 $n2
#sed -n ''$n1' p' 
m1=`sed -n ''$n1' p'  OSZICAR | awk '{print $5,$6,$7}'`
m2=`sed -n ''$n2' p' OSZICAR | awk '{print $5,$6,$7}'`
m3=`sed -n ''$n3' p' OSZICAR | awk '{print $5,$6,$7}'`
m4=`sed -n ''$n4' p' OSZICAR | awk '{print $5,$6,$7}'`
m5=`sed -n ''$n5' p' OSZICAR | awk '{print $5,$6,$7}'`
m6=`sed -n ''$n6' p' OSZICAR | awk '{print $5,$6,$7}'`
m7=`sed -n ''$n7' p' OSZICAR | awk '{print $5,$6,$7}'`
m8=`sed -n ''$n8' p' OSZICAR | awk '{print $5,$6,$7}'`
m9=`sed -n ''$n9' p' OSZICAR | awk '{print $5,$6,$7}'`
m10=`sed -n ''$n10' p' OSZICAR | awk '{print $5,$6,$7}'`
m11=`sed -n ''$n11' p' OSZICAR | awk '{print $5,$6,$7}'`
m12=`sed -n ''$n12' p' OSZICAR | awk '{print $5,$6,$7}'`
m13=`sed -n ''$n13' p' OSZICAR | awk '{print $5,$6,$7}'`
m14=`sed -n ''$n14' p' OSZICAR | awk '{print $5,$6,$7}'`
m15=`sed -n ''$n15' p' OSZICAR | awk '{print $5,$6,$7}'`
m16=`sed -n ''$n16' p' OSZICAR | awk '{print $5,$6,$7}'`
m17=`sed -n ''$n17' p' OSZICAR | awk '{print $5,$6,$7}'`
m18=`sed -n ''$n18' p' OSZICAR | awk '{print $5,$6,$7}'`
m19=`sed -n ''$n19' p' OSZICAR | awk '{print $5,$6,$7}'`
m20=`sed -n ''$n20' p' OSZICAR | awk '{print $5,$6,$7}'`

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

echo -e "$j \n $m1 \n $m2 \n $m3 \n $m4 \n $m5 \n $m6 \n $m7 \n $m8 \n $m9 \n $m10 \n $m11 \n $m12 \n $m13 \n $m14 \n $m15 \n $m16 \n $m17 \n $m18 \n $m19 \n $m20 " >> $dir/datam
echo -e "out $m1x $m1y $m1z \nout $m2x $m2y $m2z" >> $dir/datam

done
