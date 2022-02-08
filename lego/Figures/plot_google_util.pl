#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc getdata
file: ../Data/data_google_util.tab
fieldnames: days cpu mem
 
#proc areadef
   rectangle: 1 1 10 7
   xrange: 0 29
   yrange: 0 100
 
#proc xaxis
   stubs: inc
   label: Time (day)
   labeldetails: size=26
   stubdetails: size=24
   labeldistance: 1.3
   #labeldetails: adjust=0,-0.5
 
#proc yaxis
   label: Utilization (%)
   stubs: inc 20
   gridskip: min
   labeldetails: size=26
   stubdetails: size=24
   labeldistance: 1.3
   #labeldetails: adjust=-0.4,0
 
#proc lineplot
xfield: days
yfield: cpu
linedetails: color=blue width=3
legendlabel: CPU

#proc lineplot
xfield: days
yfield: mem
linedetails: color=red width=3
legendlabel: Memory

#proc legend
location: min+1 max
textdetails: size=26
seglen: 0.5
