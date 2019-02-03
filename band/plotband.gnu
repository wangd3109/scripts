set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output '1.eps'
set style data linespoints
unset ztics
set key reverse
set key samplen 2
set pointsize 1.0
set view 0,0
set xtics 13,10,43
set ytics -50,10,50
set xlabel font ",24"
set xlabel ""
set xrange [13:    42]
set ylabel font ",24"
set ylabel "Energy"
set yrange [ -10:   10]
set arrow 1 from -2 to 2 nohead
#set title "band"
plot \
'nband1' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband2' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband3' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband4' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband5' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband6' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband7' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband8' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband9' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband10' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband11' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband12' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband13' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband14' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband15' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband16' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband17' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband18' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband19' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband20' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband21' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband22' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband23' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband24' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband25' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband26' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband27' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband28' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband29' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband30' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband31' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband32' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband33' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband34' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband35' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband36' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband37' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband38' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband39' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband40' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband41' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband42' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband43' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband44' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband45' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband46' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband47' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband48' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband49' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband50' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband51' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband52' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband53' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband54' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband55' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband56' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband57' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband58' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband59' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband60' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband61' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband62' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband63' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband64' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband65' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband66' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband67' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband68' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband69' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband70' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband71' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband72' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband73' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband74' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband75' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband76' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband77' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband78' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband79' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband80' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband81' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband82' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband83' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband84' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband85' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband86' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband87' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband88' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband89' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband90' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband91' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband92' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband93' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband94' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband95' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband96' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband97' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband98' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband99' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband100' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband101' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband102' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband103' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband104' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband105' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband106' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband107' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband108' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband109' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband110' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband111' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband112' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband113' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband114' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband115' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband116' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband117' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband118' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband119' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband120' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband121' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband122' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband123' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband124' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband125' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband126' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband127' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
'nband128' u 1:2 w l lt 8 lw 3 lc 0 t "" ,\
