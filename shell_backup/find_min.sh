read -p "enter file name:" filename

e=`awk 'BEGIN{min=-1} {if ($2< min) min=$2} END {print min}' $filename`

grep -e "$e" $filename

