set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output 'afm.eps'
set style data linespoints
unset ztics
set key reverse
set key samplen 2
#set key left
set key font ",24"
set pointsize 1.0
set view 0,0
#set xtics 13,10,43
#set ytics -50,10,50
set xlabel font ",24"
set xlabel ""
#set xrange [-10:    10]
set ylabel font ",30"
set ylabel "Energy (meV)"
#set yrange [ -0.15:   0.4]
#set arrow 1 from -10 to 10 nohead
#set arrow 2 from 1,-0.15 to 1,0.4 nohead lt 0 lc 0
#set object circle at 0,0.00002 radius char 0.4 fillcolor rgb 'red' fillstyle solid
#set object circle at 0.6,-0.0481426 radius char 0.4 fillcolor rgb 'red' fillstyle solid
#set object circle at 1.0,0.043281 radius char 0.4 fillcolor rgb 'red' fillstyle solid
#set object circle at 1.2,0.351664 radius char 0.4 fillcolor rgb 'red' fillstyle solid
#set style line 1 lc rg0i
set xrange [0 : 0.43008060]
set xtics 1 ("{/Symbol G}" 0, "{X}" 0.28672040, "{W}" 0.43008060 )
set title font ",30"
set title "FCC-Fe, afm"
plot \
'magnon_afm.dat' u 1:2 w lp lt 1 lw 3 lc 0 pt 5  t "magnon dispersion" ,\
'/Users/wangd/Desktop/WORK/Fe/fcc/afm/typeI/phonon/ibrion8/from_beskow/64atoms/band3.dat' u 1:3 w l lt 1 lw 3 lc 7 t "phonon dispersion" 
