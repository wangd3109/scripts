n=`wc POSCAR |awk '{print $1}'`
constant=`awk 'NR==2{print$1}' POSCAR`
lattice_x=`awk 'NR==3,NR==5{sum += $1};END{print sum}' POSCAR`
lattice_y=`awk 'NR==3,NR==5{sum += $2};END{print sum}' POSCAR`
lattice_z=`awk 'NR==3,NR==5{sum += $3};END{print sum}' POSCAR`

x=`echo | awk '{print '$constant'*'$lattice_x'}'`
y=`echo | awk '{print '$constant'*'$lattice_y'}'`
z=`echo | awk '{print '$constant'*'$lattice_z'}'`


#echo $x $y $z
#echo $n

for i in `seq 8 1 $n`
do
	  x0=`awk 'NR=='$i'{print $1}' POSCAR`
	  y0=`awk 'NR=='$i'{print $2}' POSCAR`
	  z0=`awk 'NR=='$i'{print $3}' POSCAR`

	  x1=`echo | awk '{print '$x'*'$x0'}'`
	  y1=`echo | awk '{print '$y'*'$y0'}'`
	  z1=`echo | awk '{print '$z'*'$z0'}'`
	  natom=`echo | awk '{print '$i'-7}'`

	  echo $natom $x0 $y0 $z0";" $x1 $y1 $z1 >> tmp

	  let "a=$natom*4-2"
	  let "b=a+3"
	  
	  sed -n ''$a','$b'p' FORCE_CONSTANTS >> tmp

done
