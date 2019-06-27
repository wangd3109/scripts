#!/bin/bash

nband=$(awk 'NR==6 {print $3}' EIGENVAL)
knpoint=$(awk 'NR==6 {print $2}' EIGENVAL)

sed  '1,7d' EIGENVAL >tmp_eigenval


if [ $nband -gt 99 ]
then
	for i in `seq 1 1 9`
	do
		awk '/^    '$i'/{print $0}' tmp_eigenval > band$i
	done

	for j in `seq 10 1 99`
	do
		awk '/^   '$j'/{print $0}' tmp_eigenval >band$j
	done

	for n in `seq 100 1 $nband`
	do
		awk '/^  '$n'/{print $0}' tmp_eigenval >band$n
	done
elif [ $nband -lt 10 ]
then
	for i in `seq 1 1 $nband`
	do
		awk '/^    '$i'/{print $0}' tmp_eigenval > band$i
	done
else
	for i in `seq 1 1 9`
	do
		awk '/^    '$i'/{print $0}' tmp_eigenval > band$i
	done

	for j in `seq 10 1 $nband`
	do
		awk '/^   '$j'/{print $0}' tmp_eigenval >band$j
	done 
fi




for k in `seq 1 1 $nband` # specify the fermi-level by hand
do
	awk '{print NR-1, $2+2.79093985,$3+2.79093985}' band$k > nband$k
done


for l in `seq 1 1 $nband` # spin polarization or not
do
	echo "'nband$l'" u 1:2 w l lt 8 lw 3 lc 0 t '""' ,'\' >> plotband.gnu
#	echo "'nband$l'" u 1:3 w l lt 8 lw 3 lc 1 t '""' ,'\' >> plotband.gnu
done

rm tmp_eigenval band*
