#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 5
   xrange: 1 3
   yrange: 0 2400

#proc xaxis
   label: Number of Areas
   labeldistance: 0.9
   selflocatingstubs: text
      1        1
      2        10
      3        100
      
#proc yaxis
   label: Latency (us)
   labeldistance: 1.2
   //selflocatingstubs: text
   stubs: inc 600


 
 #proc getdata
file: ../Data/data_FAST_area.tab
fieldnames: loc Seq-MRMW-Begin Seq-MRMW-Commit Seq-MRSW-Begin Seq-MRSW-Commit Seq-Commit-Only


#proc lineplot
    xfield: loc
    yfield: Seq-MRSW-Commit
    linedetails: color=black width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=black radius=0.15 style=filled
    legendlabel: MRSW-commit-xact
#proc lineplot
    xfield: loc
    yfield: Seq-MRMW-Commit
    linedetails: color=black width=4 style=3 dashscale=4.5
    pointsymbol: shape=diamond color=black radius=0.18 linewidth=2
    legendlabel: MRMW-commit-xact
#proc lineplot
    xfield: loc
    yfield: Seq-MRSW-Begin
    linedetails: color=black width=2 style=2 dashscale=4.5
    pointsymbol: shape=square color=black radius=0.18 linewidth=2
    legendlabel: MRSW-begin-xact
#proc lineplot
    xfield: loc
    yfield: Seq-MRMW-Begin
    linedetails: color=black width=2 style=0 dashscale=4.5
    pointsymbol: shape=circle color=black radius=0.15 style=filled
    legendlabel: MRMW-begin-xact
#proc lineplot
    xfield: loc
    yfield: Seq-Commit-Only
    linedetails: color=black width=2 style=0 dashscale=4.5
    pointsymbol: shape=circle color=black radius=0.18 linewidth=2
    legendlabel: nonxact-commit








#proc legend
  format: down
  location: min+1 min+4.0
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
 
