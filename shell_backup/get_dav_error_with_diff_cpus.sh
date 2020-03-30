dir=`pwd`

for i in 1 2 3 4 5
do

for j in `seq 1 1 32`
do
cd $dir/nodes$i/$j
echo cpu$j >>$dir/node$i

strA="is not hermitian in DAV"
filename=$(find . -name slurm* -print | sed 's/^..//')
result=$(grep "$strA" $filename )
if [[ "$result" = "" ]]
then
	echo "works" >> $dir/node$i
else
	echo "failed" >> $dir/node$i
fi

#tail -20 slurm* >> $dir/node$i

done
done
