#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 100
   xscaletype: log
   yrange: 0 1200

#proc xaxis
   label: Number of areas
   labeldistance: 0.9
   selflocatingstubs: text
      1        1
      10        10
      100        100
      
#proc yaxis
   label: Latency (usec)
   labeldistance: 1.2
   //selflocatingstubs: text
   stubs: inc 200


 
 #proc getdata
file: ../Data/data_area.tab
fieldnames: loc seq-mrmw-begin seq-mrmw-commit seq-mrsw-begin seq-mrsw-commit



#proc lineplot
    xfield: loc
    yfield: seq-mrmw-begin
    linedetails: color=black width=2 style=0 dashscale=4.5
    pointsymbol: shape=circle color=black radius=0.15 linewidth=2
    legendlabel: MRMW-Begin

#proc lineplot
    xfield: loc
    yfield: seq-mrmw-commit
    linedetails: color=black width=4 style=1 dashscale=4.5
    pointsymbol: shape=triangle color=black radius=0.15 linewidth=2
    legendlabel: MRMW-Commit
    
#proc lineplot
    xfield: loc
    yfield: seq-mrsw-begin
    linedetails: color=black width=2 style=2 dashscale=4.5
    pointsymbol: shape=circle color=black radius=0.15 style=filled
    legendlabel: MRSW-Begin

#proc lineplot
    xfield: loc
    yfield: seq-mrsw-commit
    linedetails: color=black width=4 style=3 dashscale=4.5
    pointsymbol: shape=triangle color=black radius=0.15 style=filled
    legendlabel: MRSW-Commit


#proc legend
  format: down
  location: min+1 min+5.0
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
 
