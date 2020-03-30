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


## read the KPOINTS file and calculate the distance between the high symmetry points
read -p "How many high symmetry points do you have in KPOINTS file:" n_highsymmetry_points
let n_highsymmetry_points=$n_highsymmetry_points-1 ## the number of the distance
nmesh=$(awk 'NR==2{print $1}' KPOINTS )
echo 0 >> distance.dat

start_point=0
for i in `seq 1 1 $n_highsymmetry_points`
do
echo $i
	  let n1=($i-1)*3+5
	  let n2=$n1+1
	  x1=$(awk 'NR=='$n1'{print $1}' KPOINTS)
	  y1=$(awk 'NR=='$n1'{print $2}' KPOINTS)
	  z1=$(awk 'NR=='$n1'{print $3}' KPOINTS)
	  x2=$(awk 'NR=='$n2'{print $1}' KPOINTS)
	  y2=$(awk 'NR=='$n2'{print $2}' KPOINTS)
	  z2=$(awk 'NR=='$n2'{print $3}' KPOINTS)

	  distance=$(echo | awk '{x1='$x1';x2='$x2';y1='$y1';y2='$y2';z1='$z1';z2='$z2'; printf "%.10f\n", sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)+(z1-z2)*(z1-z2))}')

	  echo $distance >> distance.dat
	  dn=$(awk 'NR=='$i'{print $1}' distance.dat)
	  start_point=$( echo | awk '{start_point='$start_point';dn='$dn'; printf "%.10f\n", start_point=start_point+dn}')
echo "start_point",$start_point
	  
	  sequential=$( echo | awk '{distance='$distance';nmesh='$nmesh';printf "%.10f\n", distance/nmesh}')
#echo $sequential
#	  let sequential=$distance/$nmesh
	  
	  for j in `seq 0 1 $nmesh`
	  do
		    number=$(echo | awk '{start_point='$start_point';sequential='$sequential'; printf "%.10f\n", start_point+'$j'*sequential}')
		    echo $number
	  done


done
