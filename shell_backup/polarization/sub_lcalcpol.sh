dir=`pwd`

mkdir -p $dir/berry/lcalcpol/dipol

for i in 0 0.25 0.5 0.7 0.75
do
cd $dir/scf/
cp INCAR POSCAR POTCAR CHGCAR KPOINTS job.sh $dir/berry/lcalcpol/dipol
cd $dir/berry/lcalcpol/dipol
mkdir $i
cp INCAR POSCAR POTCAR CHGCAR KPOINTS job.sh $i
cd $i
sed -i "s/# DIPOL =/ DIPOL = $i $i $i/g" INCAR
sed -i 's/# LCALCPOL = T/ LCALCPOL = T/g' INCAR
sed -i 's/ ICHARG = 2/ ICHARG = 11/g' INCAR
sbatch job.sh
done
