##该脚本用来对Fe原子进行替换，替换原则为随机数，且最终总磁矩为0，符合反铁磁结构

for i in 31 29 27 26 23 19 16 13 11 9 5 3
do
	 sed -n ' '$i' p' Fe_new >> Yb
	 sed -i '' ''$i' d' Fe_new
	done
     	

cat title Yb Fe_new W_new > Yb_Fe_W.vasp
