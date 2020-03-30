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


read -p "Tell me the fermi level:" efermi

for k in `seq 1 1 $nband` # specify the fermi-level by hand
do
	awk '{print $2-'$efermi',$3-'$efermi',$4,$5}' band$k > nband$k
      rm band$k
done


for l in `seq 1 1 $nband` # spin polarization or not
do
	echo "'Band$l'" u 1:2 w l lt 8 lw 3 lc 0 t '""' ,'\' >> plotband.gnu
	echo "'Band$l'" u 1:3 w l lt 8 lw 3 lc 7 t '""' ,'\' >> plotband.gnu
done

## read the KPOINTS file and calculate the distance between the high symmetry points
read -p "How many high symmetry points do you have in KPOINTS file:" n_highsymmetry_points
let n_highsymmetry_points=$n_highsymmetry_points-1 ## the number of the distance
nmesh=$(awk 'NR==2{print $1}' KPOINTS )
echo 0 >> distance.dat


let start_point=0
for i in `seq 1 1 $n_highsymmetry_points`
do
#echo $i
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
echo "high symmetry points",$start_point  >> highsymmetry.dat
	  
	  sequential=$( echo | awk '{distance='$distance';nmesh='$nmesh';printf "%.10f\n", distance/nmesh}')
#echo $sequential
#	  let sequential=$distance/$nmesh
	  
	  for j in `seq 0 1 $nmesh`
	  do
		    number=$(echo | awk '{start_point='$start_point';sequential='$sequential'; printf "%.5f\n", start_point+'$j'*sequential}')
		    echo $number>> tmp
	  done
done

sort -k1 -u tmp >x
sed -i '1d' x
rm tmp

##### insert the fat band part
natom=$(awk 'NR==2{ print $12}' PROCAR)
echo $natom
n=$(wc PROCAR | awk '{print $1}')
half_n=$(($n/2))
nband=$(awk 'NR==2 { print $8}' PROCAR )

sed -n '1,'$half_n' p' PROCAR > spin_up
sed -n ''$half_n','$n' p'  PROCAR > spin_dn

### for the spin up
#for i in `seq 100 1 $nband`
rm fat_up* fat_dn* Re* Fe* Cu* O* A* ion* nline*
for i in `seq 150 1 200`
do
        grep -n 'band   '$i'' spin_up | awk '{print $1}' > nline_band$i
        sed -i 's/:band//g' nline_band$i

        nline=$(wc nline_band"$i" | awk '{print $1}')

        for j in `seq 1 1 $nline`
        do
                nline_a=$(awk 'NR=='$j' {print $1}'  nline_band"$i")
                let nline_b=$nline_a+45
                sed -n ''$nline_a','$nline_b' p' spin_up >> fat_up_$i
        done

        ##

        for j in `seq 1 1 9`
        do
                awk  '/^    '$j'/ {print $2+$3+$4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18}' fat_up_$i >ion$j
        done


## specify the number of atoms
        for j in `seq 10 1 40`
        do
                awk  '/^   '$j'/ {print $2+$3+$4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18}' fat_up_$i > ion$j
        done
        rm A* Cu* Fe* Re* O*

        paste ion1 ion2 >>A
        awk '{print $1+$2}' A > A.dat
        paste ion3 ion4 ion5 ion6 ion7 ion8 >> Cu
        awk '{print  $1+$2+$3+$4+$5+$6}' Cu >  Cu.dat

        paste ion9 ion10 ion11 ion12 >> Fe
        awk '{print $1+$2+$3+$4}' Fe > Fe.dat
        paste ion13 ion14 ion15 ion16 >> Re
        awk '{print $1+$2+$3+$4}' Re > Re.dat
        paste ion17 ion18 ion19 ion20 ion21 ion22 ion23 ion24 ion25 ion26 ion27 ion28 ion29 ion30 ion31 ion32 ion33 ion34 ion35 ion36 ion37 ion38 ion39 ion40 > O
        awk '{print $1+$2+$3+$4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24}' O > O.dat

        paste A.dat Cu.dat Fe.dat Re.dat O.dat > fatup$i
done
### for the spin dn
rm fat_up* fat_dn* Re* Fe* Cu* O* A* ion* nline*
for i in `seq 150 1 200`
do
        grep -n 'band   '$i'' spin_dn | awk '{print $1}' > nline_band$i
        sed -i 's/:band//g' nline_band$i

        nline=$(wc nline_band"$i" | awk '{print $1}')

        for j in `seq 1 1 $nline`
        do
                nline_a=$(awk 'NR=='$j' {print $1}'  nline_band"$i")
                let nline_b=$nline_a+45
                sed -n ''$nline_a','$nline_b' p' spin_dn >> fat_dn_$i
        done

        ##

        for j in `seq 1 1 9`
        do
                awk  '/^    '$j'/ {print $2+$3+$4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18}' fat_dn_$i >ion$j
        done


        ## specify the number of atoms
        for j in `seq 10 1 40`
        do
                awk  '/^   '$j'/ {print $2+$3+$4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18}' fat_dn_$i > ion$j
        done
        rm A* Cu* Fe* Re* O*


        paste ion1 ion2 >>A 
        awk '{print $1+$2}' A > A.dat
        paste ion3 ion4 ion5 ion6 ion7 ion8 >> Cu
        awk '{print  $1+$2+$3+$4+$5+$6}' Cu >  Cu.dat

        paste ion9 ion10 ion11 ion12 >> Fe
        awk '{print $1+$2+$3+$4}' Fe > Fe.dat
        paste ion13 ion14 ion15 ion16 >> Re
        awk '{print $1+$2+$3+$4}' Re > Re.dat
        paste ion17 ion18 ion19 ion20 ion21 ion22 ion23 ion24 ion25 ion26 ion27 ion28 ion29 ion30 ion31 ion32 ion33 ion34 ion35 ion36 ion37 ion38 ion39 ion40 > O
        awk '{print $1+$2+$3+$4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24}' O > O.dat


        paste A.dat Cu.dat Fe.dat Re.dat O.dat > fatdn$i


done

rm fat_up_* fat_dn_* ion* nline* A* Cu* Fe* Re* O*


## collect all the data
for i in `seq 1 1 $nband`
do
paste x nband$i fatup$i fatdn$i> Band$i
rm nband$i
done

tar czf data.tar.gz Band* highsymmetry* distance* plot*
