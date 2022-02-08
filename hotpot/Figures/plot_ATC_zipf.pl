#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 7
   xrange: 1 4
   yrange: 0 600

#proc xaxis
   label: Degree of Replication
   labeldistance: 0.9
   labeldetails: size=24
   selflocatingstubs: text
      1        1
      2        2
      3        3
      4	       4
      
#proc yaxis
   label: Commit Latency (us)
   labeldistance: 1.0
   stubs: inc 200
   labeldetails: size=24


 
 #proc getdata
file: ../Data/data_ATC_zipf.tab
fieldnames: loc 1MB-Region-No-Mig 1MB-Region-Mig 4MB-Region-No-Mig 4MB-Region-Mig

#proc lineplot
    xfield: loc
    yfield: 4MB-Region-No-Mig
    linedetails: color=black width=4 style=0 dashscale=4.5
    //pointsymbol: shape=square color=black radius=0.05 style=filled
    legendlabel: 4MB-Region-No-Mig
#proc lineplot
    xfield: loc
    yfield: 4MB-Region-Mig
    linedetails: color=red width=4 style=4 dashscale=4.5
    //pointsymbol: shape=square color=black radius=0.05 linewidth=2 color=grey(0.7)
    legendlabel: 4MB-Region-Mig
#proc lineplot
    xfield: loc
    yfield: 1MB-Region-No-Mig
    linedetails: color=green width=4 style=2 dashscale=4.5
    //pointsymbol: shape=circle color=black radius=0.05 style=filled color=grey(0.5)
    legendlabel: 1MB-Region-No-Mig
#proc lineplot
    xfield: loc
    yfield: 1MB-Region-Mig
    linedetails: color=blue width=4 style=1 dashscale=4.5
    //pointsymbol: shape=circle color=black radius=0.05 linewidth=2 color=grey(0.2)
    legendlabel: 1MB-Region-Mig


#proc legend
  format: down
  textdetails: size=18
  location: min+4.5 min+2.5
  seglen: 0.8
