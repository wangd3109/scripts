dir=`pwd`

mkdir `seq 0 1 24`
mkdir total

for i in `seq 1 1 9`
do
cd $dir
cp MPOSCAR-00$i $i/POSCAR
cp INCAR POTCAR KPOINTS job.sh $i
cd $i
sbatch job.sh
done

for j in `seq 10 1 24`
do
cd $dir
cp MPOSCAR-0$j $j/POSCAR
cp INCAR KPOINTS POTCAR job.sh $j
cd $j
sbatch job.sh
done

cd $dir
cp MPOSCAR-orig INCAR POTCAR KPOINTS job.sh 0
cp MPOSCAR INCAR POTCAR KPOINTS job.sh total
cd $dir/0
mv MPOSCAR-orig POSCAR
sbatch job.sh
cd $dir/total
mv MPOSCAR POSCAR
sbatch job.sh

