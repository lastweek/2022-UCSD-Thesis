#!/bin/sh
find plot_*.pl >  tmplist 
while read line; do echo $line; ploticus $line -eps -o g_$line.eps -textsize 18 -font /Courier ;  epstopdf g_$line.eps;  done < tmplist 
rm -rf tmplist
for file in *.pl.eps
do
mv ${file} ${file%.pl.eps}.eps
done
for file in *.pl.pdf
do
mv ${file} ${file%.pl.pdf}.pdf
done
exit
find plot*.py >  tmplist 
while read line;
    do echo $line; python $line "g_${line%.py}"
done < tmplist
rm -rf tmplist
