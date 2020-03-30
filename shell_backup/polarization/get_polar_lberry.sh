dir=`pwd`


for a in 1 2 3 4
do

for i in  1 2 3
do
cd $dir/$a/$i

for j in 0 0.5 0.7 0.75
do
cd $dir/$a/$i/dipol/$j
e_ev=`grep 'e<r>_ev' OUTCAR | awk '{print $2, $3, $4 }'`
e_bp=`grep 'e<r>_bp' OUTCAR | awk '{print $2, $3, $4 }'`
p_ion=`grep 'ionic dipole moment' OUTCAR |awk '{print $5, $6, $7}'`

echo -e "direction $i \n e_ev: $e_ev \n e_bp: $e_bp \n p_ion: $p_ion" >> $dir/$a/$j


done

done
done
