##该脚本用来对POSCAR的B位置替换W原子，按照之前的结构（W2）

#!/bin/bash
for i in `seq 1 1 16`
do
a=$(awk 'NR=='$i'{print $0}' W2)
echo $a

grep -n "$a" B3 >>tmp


#sed -i '' 's/$/& Yb/g' B_new
done

sed -i '' 's/:/ /g' tmp
sort -rnk 1 tmp >tmp2


for j in `seq 1 1 16`
do
	  n=$(awk 'NR=='$j'{print $1}' tmp2)
	  echo $n
	  sed -n ''$n' p' B3 >> W_new
	  sed -i ''  ''$n' d' B3
done

mv B3 Fe_new

cat title Fe_new W_new >> Fe_W.vasp

#cp B_backup B
#for i in 43  41  38  33  32  31  30  28  24  16  12  10  8  7  5  3
#do
#	  sed -n ''$i' p' B >> W
#	  sed -i '' ''$i' d' B
#done
#
#mv B Fe
#sort -n -k3 Fe > Fe_sorted
