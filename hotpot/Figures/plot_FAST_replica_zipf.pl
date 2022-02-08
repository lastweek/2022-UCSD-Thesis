#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 12 6
   xrange: 1 4
   yrange: 0.0 1.0

#proc xaxis
   label: Degree of Replication
   labeldistance: 0.9
   selflocatingstubs: text
      1        1
      2        2
      3        3
      4        4
      
#proc yaxis
   label: Ratio (Mig./No-Mig.)
   labeldistance: 1.0
   #selflocatingstubs: text
   stubs: inc 0.2
    
 
 #proc getdata
file: ../Data/data_FAST_replica_zipf.tab
fieldnames: loc Begin Commit Total

//#proc lineplot
    //xfield: loc
    //yfield: Begin
    //linedetails: color=black width=2 style=0 dashscale=4.5
    //pointsymbol: shape=circle color=black radius=0.18 linewidth=2
    //legendlabel: begin-xact
#proc lineplot
    xfield: loc
    yfield: Total
    linedetails: color=black width=4 style=3 dashscale=4.5
    pointsymbol: shape=diamond color=black radius=0.18 linewidth=2
    legendlabel: total-xact-duration
#proc lineplot
    xfield: loc
    yfield: Commit
    linedetails: color=black width=2 style=2 dashscale=4.5
    pointsymbol: shape=square color=black radius=0.18 linewidth=2
    legendlabel: commit-xact


#proc legend
  format: down
  location: min+1 min+2.0
  seglen: 0.8

//linedetails: color=black width=6 style=10
//pointsymbol: shape=square color=black radius=0.15
//legendlabel: async-nw
 
 
 
#//##proc getdata
#file: ../emulator/data/hlmplanefastssdlatency
#fieldnames: range throughput
#
#//#proc lineplot
#xfield: range
#yfield: throughput
#pointsymbol: shape=square color=black radius=0.1
#linedetails: color=black width=6 style=10
#legendlabel: Hybrid_SSD2
# 
#//#proc getdata
#file: ../emulator/data/plmplanelatency
#fieldnames: range throughput 
#
#//#proc lineplot
#xfield: range
#yfield: throughput
#linedetails: color=black width=1 style=0
#pointsymbol: shape=nicecircle fillcolor=black radius=0.1
#legendlabel: Page-level_SSD1
# 
#
#//#proc getdata
#file: ../emulator/data/plmplanefastssdlatency
#fieldnames: range throughput 
#
#///#proc lineplot
#xfield: range
#yfield: throughput
#linedetails: color=black width=6 style=0
#pointsymbol: shape=square fillcolor=black radius=0.1
#legendlabel: Page-level_SSD2
 
