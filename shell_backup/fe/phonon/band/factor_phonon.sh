

awk '{print $1, $2, $2*4.13567}' band.dat > band_tmp.dat
sed -i '' 's/  0/ /g' band_tmp.dat
cp band_tmp.dat band3.dat

#sed -i ''  '1,3d' band_tmp.dat
#sed -i '' '/^[ ]*$/d' band_tmp.dat
#awk '{print $1*6.8778, $2, $3}' band_tmp.dat > band4.dat
