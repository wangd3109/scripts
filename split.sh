#!/bin/sh

for i in `seq 0 1 130`
do
let "a=6+$i*2001"
let "b=2006+$i*2001"
echo  $a $b>> range
sed -n "$a,$b p" DOSCAR >DOS$i		# 截取指定行
sed  '1d' DOS$i >1DOS$i 		# delete the first line
#sed -n "$a,$b p" DOSCAR > DOS$i
echo $i
done
#fermi=$(awk 'NR==6 {print $4}' DOSCAR)
awk '{print $1-1.81994602}' 1DOS0 >e	# 调整费米能级

for i in `seq 0 1 130`
do
awk '{$1="";print $0}' 1DOS$i >2DOS$i	# 删除首列
awk '{print $1, $5, $9}' 2DOS$i >3DOS$i	# 指定spd轨道的三个总态密度
cut -b 1-6 3DOS$i > tmp1 # s orbital
cut -b 8-10 3DOS$i > tmp2
cut -b 12-17 3DOS$i >tmp3 # p orbital
cut -b 19-21 3DOS$i >tmp4
cut -b 23-28 3DOS$i >tmp5 # d orbital
cut -b 30-32 3DOS$i > tmp6
paste tmp1 tmp2 >sDOS$i
paste tmp3 tmp3 >pDOS$i
paste tmp5 tmp6 >dDOS$i
awk '{print $1*10^$2}' sDOS$i >s4DOS$i
awk '{print $1*10^$2}' pDOS$i >p4DOS$i
awk '{print $1*10^$2}' dDOS$i >d4DOS$i
paste e s4DOS$i p4DOS$i d4DOS$i> nDOS$i
done

#rm 1DOS* 2DOS* 3DOS* tmp* s4* p4* d4* DOS* sDOS* pDOS* dDOS*

#awk '{print $1-$fermi}' DOSCAR >e
