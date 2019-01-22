

for j in  2 3 4 5 6 7 8
do

dir=/cfs/klemming/nobackup/d/duowang1/WORK/LaMnO3/RSPt/12.23/vesta/868/afm
touch jij/$j
for i in `seq 0.0 0.1 2.0`
do
cd $dir
cd scf-jij/$j/$j-$i-jij
tail -202 out > tmp1
j1=$(sed -n '1,1p' tmp1 |awk '{print $7}') 
j2=$(sed -n '2,2p' tmp1 |awk '{print $7}')
echo $i $j1 $j2 >>$dir/jij/$j
done
done

