#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 4
   yrange: 0 2500

#proc xaxis
   label: Number of replicas
   labeldistance: 0.9
   selflocatingstubs: text
      1 1
      2 2
      3 3
      4 4
      
#proc yaxis
   label: Latency (usec)
   labeldistance: 1.2
   //selflocatingstubs: text
   stubs: inc 500


 
 #proc getdata
file: ../Data/data_replica.tab
fieldnames: loc seq-mrmw-begin seq-mrmw-commit seq-mrsw-begin seq-mrsw-commit

#proc lineplot
    xfield: loc
    yfield: seq-mrmw-begin
    linedetails: color=black width=4 style=1 dashscale=4.5
    pointsymbol: shape=circle color=black radius=0.15 style=filled
    legendlabel: MRMW-Begin

#proc lineplot
    xfield: loc
    yfield: seq-mrmw-commit
    linedetails: color=black width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=black radius=0.15 style=filled
    legendlabel: MRMW-Commit



#proc legend
  location: min+1.2 min+5.0
 
 
 
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
 
