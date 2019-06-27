# 此文件用来自动化执行cub文件
#!/bin/bash

dir=/cfs/klemming/nobackup/d/duowang1/WORK/LaMnO3/RSPt/12.23/vesta/afm/scf-jij

for i in `seq 1.3 0.1 2.0`
do
cd  $dir/8-$i-jij/bz
cub << EOF
./lowsym
n
6 4 6
0 0 0
1 1 1



EOF

cd ..
link_spts 4_no_1
sbatch job.sh
done
