set multiplot layout 1,2

set timefmt "%H:%M:%S"
set xdata time
set xtics
set xtics rotate
set xtics format "%H:%M:%S"
set xtics mirror
set xlabel "Timestamp of measurement"
set size 0.5,1
set origin 0,0
unset ylabel
unset y2label
unset ytics
unset y2tics

set title "Overview"

set key outside
set key center
set key bottom
set key title "Legend"
set key box width 1 height 1

plot "gpTEMP" using 1:2 axes x1y1 with lines t "temperature" ,\
"gpLOAD" using 1:2 axes x1y1 with lines t "load average per minute" ,\
"gpFAN" using 1:2 axes x1y2 with lines t "CPU fan speed"

set ylabel "temperature [K]"
set y2label "load"
set ytics
set y2tics
set ytics nomirror
set y2tics nomirror
set origin 0.5,0

set title "Load vs. temperature"

plot "gpTEMP" using 1:2 axes x1y1 with linespoints t "temperature" ,\
"gpLOAD" using 1:2 axes x1y2 with linespoints t "load average per minute"

unset multiplot
