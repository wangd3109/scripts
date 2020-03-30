rm head atoms O* Ca* Mn* Co* POSCAR2

sed -n '1,8p' SPOSCAR > head
sed -n '9,140p' SPOSCAR > atoms

sed -n '1,72p' atoms > O
sed -n '73,108p' atoms > Ca
sed -n '109,120p' atoms > Mn
sed -n '121,132p' atoms > Co

awk '{print $1,$2,$3,"#O"}' O > O2
awk '{print $1,$2,$3,"#Ca"}' Ca > Ca2
awk '{print $1,$2,$3,"#Mn"}' Mn > Mn2
awk '{print $1,$2,$3,"#Co"}' Co > Co2

for i in `seq 1 1 6`
do
	  awk 'NR=='$i'{print $0,"up"}' Mn2 >> Mn2_up
	  awk 'NR=='$i'{print $0,"up"}' Co2 >> Co2_up
done

for i in `seq 7 1 12`
do
	  awk 'NR=='$i'{print $0,"dn"}' Mn2 >> Mn2_dn
	  awk 'NR=='$i'{print $0,"dn"}' Co2 >> Co2_dn
done


for i in 1
do
	  m_u=$(expr $[RANDOM%4+1])
	  m_d=$(expr $[RANDOM%4+1])
	  c_u=$(expr $[RANDOM%4+1])
	  c_d=$(expr $[RANDOM%4+1])

	  echo $m_u $m_d $c_u $c_d

	  sed -i '' ''$m_u's/up/up fliped/g' Mn2_up
	  sed -i '' ''$m_d's/dn/dn fliped/g' Mn2_dn
	  sed -i '' ''$c_u's/up/up fliped/g' Co2_up
	  sed -i '' ''$c_d's/dn/dn fliped/g' Co2_dn
done
#for i in 1 2 3 4
#do
#	  random=$(echo | awk '{r='$RANDOM';a=32676; print (r/a)*4}')
#	  if [ $random < 0.5 ]; then
#		    random=0
#		    echo $random
#	  else
#		    echo "didn't change"
#		    if
#	  echo $random
#done


cat head O2 Ca2 Mn2_up Mn2_dn Co2_up Co2_dn > POSCAR3

rm O2 Ca2 Mn2* Co2* O Ca  Mn Co
