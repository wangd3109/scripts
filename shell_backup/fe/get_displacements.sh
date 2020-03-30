constant=126

for i in `seq 0 1 11`
do
	  let n1=113+$i*$constant
	  let n2=n1+59
	  echo $n1, $n2
sed -n ''$n1','$n2'p' modulation.yaml | awk '{print $8, $9}' |sed 's/(//g' | sed 's/)//g' > band$i
done

for j in `seq 1 1 11`
do
	  awk '{print $2}' band$j > tmp$j
done

paste band0 tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 tmp9 tmp10 tmp11 > band



#sed -n '41,46p' modulation.yaml | awk '{print $8, $9}' |sed 's/(//g' | sed 's/)//g'
