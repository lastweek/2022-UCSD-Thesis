#!/bin/sh
find plot*.pl >  tmplist 
while read line; do echo $line; pl $line -eps -o g_$line.eps -textsize 18 -font /Courier ;  epstopdf g_$line.eps;  done < tmplist 
rm -rf tmplist
for file in *.pl.eps
do
mv ${file} ${file%.pl.eps}.eps
done
for file in *.pl.pdf
do
mv ${file} ${file%.pl.pdf}.pdf
done

find plot*.py >  tmplist 
while read line;
    do echo $line; python $line "g_${line%.py}"
done < tmplist
rm -rf tmplist
python PLOT_combined_network_trace.py --readfile1 PLOT_graphlab --readfile2 PLOT_grappa --title1 PowerGraph --title2 Grappa --output g_plot_combined_trace --readfile3 PLOT_hotpot --title3 Hotpot --time_len 500
