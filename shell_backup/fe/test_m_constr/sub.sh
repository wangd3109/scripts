dir=`pwd`

for i in 0.9 #`seq 1.0 0.1 2.0`
do
cd $dir
mkdir $i
cp INCAR POSCAR KPOINTS POTCAR job.sh create_moment.sh $i
cd $i	

### start to edit the INCAR file		
# create and edit the moment.dat file
sed -i 's/size=3/size='$i'/g' create_moment.sh
#sed -i '12,21d' INCAR
bash create_moment.sh > ./moment.dat
sed -i '10s/.$//' moment.dat
sed -i 's/--//g' moment.dat
a=`awk 'NR==6{print $2}' moment.dat `
sed -i 's/'$a'/0/g' moment.dat
 
# INCAR file
echo "I_CONSTRAINED_M = 2 " >>INCAR
echo " LAMBDA = 10" >>INCAR
echo " RWIGS = 1.305" >>INCAR
echo "M_CONSTR = " '\' >>INCAR
cat moment.dat >> INCAR

sbatch job.sh

done


