dir=`pwd`

for a in lda pbe pbesol
do


for j in 0 0.25 0.5 0.7 0.75
do
cd $dir/$a/lcalcpol/dipol/$j
p_elc=`grep 'Total electronic dipole moment' OUTCAR | awk '{print $6,$7,$8}' `
p_ion=`grep 'Ionic dipole moment' OUTCAR |awk '{print $5, $6, $7}'`

echo -e "dipol=$j \n p_ion: $p_ion \n p_elc: $p_elc" >> $dir/$a/lcalcpol/functional_$a

done

done
