dir=`pwd`

cd $dir/phase1
sed -n '9,74p' CONTCAR > atomsa
sed -n '1,8p' CONTCAR > head
cd $dir/phase2
sed -n '9,74p' CONTCAR >atoms


for i in `seq 1 1 66`
do
	  cd $dir/phase1
	  x1=$(awk 'NR=='$i'{print $1}' atoms)
	  y1=$(awk 'NR=='$i'{print $2}' atoms)
	  z1=$(awk 'NR=='$i'{print $3}' atoms)
	  cd $dir/phase2
	  x2=$(awk 'NR=='$i'{print $1}' atoms)
	  y2=$(awk 'NR=='$i'{print $2}' atoms)
	  z2=$(awk 'NR=='$i'{print $3}' atoms)

	  ## difference
#	  dx1=$(echo | awk "{print ($x2-$x1)/8}")
#	  dx=$(echo "$x1 $x2"| awk '{printf ("%5.f/\n", $x2-$x1)}')
	  dx=$(echo | awk '{x1='$x1';x2='$x2'; printf "%.16f\n",(x2-x1)/8}')
	  dy=$(echo | awk '{y1='$y1';y2='$y2'; printf "%.16f\n",(y2-y1)/8}')
	  dz=$(echo | awk '{z1='$z1';z2='$z2'; printf "%.16f\n",(z2-z1)/8}')

	  echo $dx $dy

	  for j in `seq 0 1 8`
	  do
		    nx=$(echo | awk '{x1='$x1';dx='$dx';n='$j';printf "%.16f\n", x1+n*dx}') 
		    ny=$(echo | awk '{y1='$y1';dy='$dy';n='$j';printf "%.16f\n", y1+n*dy}')
		    nz=$(echo | awk '{z1='$z1';dz='$dz';n='$j';printf "%.16f\n", z1+n*dz}')





		    echo  $nx $ny $nz >> $dir/atoms_$j
	  done
	
done

cd $dir
for j in `seq 0 1 8`
do
	  cat $dir/phase1/head atoms_$j > POSCAR_$j
done
	  

rm atoms*
