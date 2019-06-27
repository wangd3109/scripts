#!/bin/bash

nband=$(awk 'NR==6 {print $3}' EIGENVAL)
nkpoint=$(awk 'NR==6 {print $2}' EIGENVAL)

for i in `seq 1 1 $nkpoint`
do
	let "k=8+(i-1)*($nband+2)"
	let "a=9+(i-1)*($nband+2)"
	let "b=8+$nband+(i-1)*($nband+2)"
	#sed -n "$a,$b p" EIGENVAL >0band_k$i # to write every eigenvalue at eack K point
	sed -n "$k p" EIGENVAL >> kpoints # to write every K point
done
