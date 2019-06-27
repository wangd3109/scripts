dir=/cfs/klemming/nobackup/d/duowang1/WORK/LaMnO3/RSPt/12.23/vesta/868/afm

for j in 3 4 5 6 7 8
do

for i in `seq 0.0 0.1 2.0`
do
cd $dir
cp -rf scf/$j/$j-$i scf-jij/$j/$j-$i-jij
cp green_jij.inp scf-jij/$j/$j-$i-jij/green.inp
cp job.sh scf-jij/$j/$j-$i-jij/job.sh
cd scf-jij/$j/$j-$i-jij
sed -i "s/8 1.9/$j $i/g" green.inp
rm hamil* densmtx.* locust* dmft_lock_file overlap.* ve.tmp.* va.tmp.* rspt_fft_wisdom.* wt.tmp* slu*
cp ../../job.sh ./
cp symcof bz/lowsym
cd bz
sed -i '8,11d' lowsym
sed -i "s/2     2 group order, spins/1     2 group order, spins/" lowsym

cub << EOF
./lowsym
n
8 6 8
0 0 0
1 1 1



EOF
cd ..
link_spts 6_no_1
sbatch job.sh
done

done
