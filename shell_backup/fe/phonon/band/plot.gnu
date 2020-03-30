set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output '2.eps'
set style data linespoints
unset ztics
#set key reverse
set key samplen 2
set key left
#set key box
set pointsize 1.0
set view 0,0
set xtics ("{/Symbol G}" 0,"X" 0.14539550, "W" 0.21809320, "{/Symbol G}" 0.38313220, "L" 0.58676580)
#set ytics -50,10,50
set xlabel font ",24"
set xlabel ""
set xrange [0:    0.58676580]
set ylabel font ",24"
set ylabel "Frequency (meV)"
#set yrange [ -10:   10]
#set arrow 1 from -10 to 10 nohead
#set title ""
plot \
'band_2.dat' u 1:3 w l lt -1 lw 2 lc 1 t "" ,\
