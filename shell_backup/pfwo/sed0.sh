##该脚本用来处理240atoms的POSCAR，将每层原子单独列出，分别排序，以标注磁矩方向

for i in `seq 1 1 6`
do
	  let a=(i-1)*8+1
	  let b=a+7
	  echo $a $b
	  sed -n  ''$a','$b'p' B2 > layer_$i
	  sed -i '' 's/-0.000000000/ 0.000000000/g' layer_$i

	  sort -k 1 layer_$i >layer_sorted1_$i

#	  s=-1*$i
	  echo layer $i
	  let s=-1**$i
	  echo $s
	  awk 'NR==1 {a='$s'; print $0, "#",a}' layer_sorted1_$i >> layer_after_tag_$i
	  awk 'NR==2 {a='$s'; print $0, "#",a}' layer_sorted1_$i>> layer_after_tag_$i
	  awk 'NR==3 {a='$s'; print $0, "#",-a}' layer_sorted1_$i>> layer_after_tag_$i
	  awk 'NR==4 {a='$s'; print $0, "#",-a}' layer_sorted1_$i >> layer_after_tag_$i
	  awk 'NR==5 {a='$s'; print $0, "#",a}' layer_sorted1_$i >> layer_after_tag_$i
	  awk 'NR==6 {a='$s'; print $0, "#",a}' layer_sorted1_$i >> layer_after_tag_$i
	  awk 'NR==7 {a='$s'; print $0, "#",-a}' layer_sorted1_$i >> layer_after_tag_$i
	  awk 'NR==8 {a='$s'; print $0, "#",-a}' layer_sorted1_$i >> layer_after_tag_$i
done

cat layer_after_tag_1  layer_after_tag_2  layer_after_tag_3  layer_after_tag_4  layer_after_tag_5  layer_after_tag_6   > B3

rm layer*
