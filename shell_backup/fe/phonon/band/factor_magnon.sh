
# for fcc fe q1
#awk '{print $1*0.14540, $2*1000}' magnon.dat >magnon_tmp.dat
# for fcc fe afm
#awk '{print $1*0.2867, $2*1000}' magnon.dat >magnon_tmp.dat
# for bcc fm
awk '{print $1*0.2867, $2*1000}' magnon.dat >magnon_tmp.dat


min=$(awk 'BEGIN{min=0} {if ($2< min) min=$2} END {print min}' magnon_tmp.dat)
#echo $min
awk '{print $1, $2-"'$min'"}' magnon_tmp.dat >magnon_afm.dat

