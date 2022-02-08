#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 7
   xrange: 1 4
   yrange: 0 250

#proc xaxis
   label: Number of Nodes Committing
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=17
   selflocatingstubs: text
      1        1
      2        2
      3        3
      4        4
     
#proc yaxis
   label: Latency (us)
   labeldistance: 1.0
   labeldetails: size=24
   stubs: inc 50

#proc getdata
file: ../Data/data_SOCC_conflict.tab
fieldnames: loc MRSW-Conflict MRSW-NoConflict MRMW-Conflict MRMW-NoConflict

#proc lineplot
    xfield: loc
    yfield: MRSW-Conflict
    linedetails: color=blue width=4 style=0 dashscale=7
    pointsymbol: shape=square color=blue radius=0.22 style=filled
    legendlabel: MRSW-Conflict
    legendsampletype: line+symbol
#proc lineplot
    xfield: loc
    yfield: MRSW-NoConflict
    linedetails: color=green width=4 style=0 dashscale=7
    pointsymbol: shape=circle color=green radius=0.22
    legendlabel: MRSW-NoConflict
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: MRMW-Conflict
    linedetails: color=red width=2 style=3 dashscale=7
    pointsymbol: shape=triangle color=red radius=0.22 style=filled
    legendlabel: MRMW-Conflict
    legendsampletype: line+symbol
#proc lineplot
    xfield: loc
    yfield: MRMW-NoConflict
    linedetails: color=black width=2 style=5 dashscale=7
    pointsymbol: shape=diamond color=black radius=0.22
    legendlabel: MRMW-NoConflict
    legendsampletype: line+symbol

#proc legend
  format: down
  textdetails: size=18
  location: min+2.0 min+2.1
  seglen: 1.0
  noclear: yes
  specifyorder: MRSW-Conflict
  		MRMW-Conflict
  		MRSW-NoConflict
		MRMW-NoConflict
