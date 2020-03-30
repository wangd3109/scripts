dir=`pwd`

for i in lda pbe pbesol
do
mkdir -p $dir/scf/$i
cd $dir/relax/$i
cp INCAR CONTCAR POTCAR KPOINTS job.sh $dir/scf/$i
cd $dir/scf/$i
mv CONTCAR POSCAR
sed -i 's/ IBRION = 2/# IBRION = 2/g' INCAR
sed -i 's/ NSW    = 200/# NSW    = 200/g' INCAR
sed -i 's/ ISIF   = 3/# ISIF   = 3/g' INCAR
sed -i 's/ LCHARG = F/# LCHARG = F/g' INCAR
sed -i 's/5 5 5/10 10 10/g' KPOINTS
sbatch job.sh
done
