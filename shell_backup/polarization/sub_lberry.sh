dir=`pwd`

mkdir -p $dir/berry/lberry/dipol

for i in 0 #0.25 0.5 0.7 0.75
do
cd $dir/scf/
cp INCAR POSCAR POTCAR CHGCAR KPOINTS job.sh $dir/berry/lberry/dipol
cd $dir/berry/lberry/dipol
mkdir $i

for j in 1 2 3
do
mkdir -p $dir/berry/lberry/dipol/$i/$j
cd $dir/berry/lberry/dipol/
cp INCAR POSCAR POTCAR CHGCAR KPOINTS job.sh $i/$j
cd $i/$j
sed -i "s/# DIPOL =/ DIPOL = $i $i $i/g" INCAR
sed -i 's/# LBERRY = T/ LBERRY = T/g' INCAR
sed -i 's/# NPPSTR = 8/ NPPSTR = 8/g' INCAR
sed -i "s/# IGPAR = / IGPAR = $j/g" INCAR
sed -i 's/ ICHARG = 2/ ICHARG = 11/g' INCAR
sbatch job.sh
done

done
