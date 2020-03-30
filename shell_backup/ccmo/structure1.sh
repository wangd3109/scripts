rm head atoms O* Ca* Mn* Co*

sed -n '1,8p' POSCAR > head
sed -n '9,74p' POSCAR > atoms

sed -n '1,36p' atoms > O
sed -n '37,54p' atoms > Ca
sed -n '55,60p' atoms > Mn
sed -n '61,66p' atoms > Co

awk '{print $1,$2,$3,"#O"}' O > O2
awk '{print $1,$2,$3,"#Ca"}' Ca > Ca2
awk '{print $1,$2,$3,"#Mn"}' Mn > Mn2
awk '{print $1,$2,$3,"#Co"}' Co > Co2

for i in 1 3 5
do
	  awk 'NR=='$i'{print $0,"up"}' Mn2 >> Mn2_up
	  awk 'NR=='$i'{print $0,"up"}' Co2 >> Co2_up
	  let j=$i+1
	  echo $j
	  awk 'NR=='$j'{print $0,"dn"}' Mn2 >> Mn2_dn
	  awk 'NR=='$j'{print $0,"dn"}' Co2 >> Co2_dn
done


cat O2 Ca2 Mn2_up Mn2_dn Co2_up Co2_dn > atom_tmp

cat head atom_tmp >> POSCAR2

rm O* Ca* Mn* Co* head atoms atom*
