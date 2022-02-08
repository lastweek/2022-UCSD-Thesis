#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 7
   xrange: 1 3
   yrange: 0 450

#proc xaxis
   label: Number of Nodes
   labeldistance: 0.9
   labeldetails: size=24
   selflocatingstubs: text
      1        4
      2        8
      3        16
      
#proc yaxis
   label: Latency (us)
   labeldistance: 1.0
   labeldetails: size=24
   stubs: inc 100


 
 #proc getdata
file: ../Data/data_FAST_node.tab
fieldnames: loc MRSW-T-begin MRSW-T-commit MRMW-T-begin MRMW-T-commit MRMW-C-commit

#proc lineplot
    xfield: loc
    yfield: MRMW-T-commit
    linedetails: color=black width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=black radius=0.15 style=filled
    legendlabel: MRMW-T-commit
#proc lineplot
    xfield: loc
    yfield: MRSW-T-begin
    linedetails: color=black width=2 style=0 dashscale=4.5
    pointsymbol: shape=circle color=black radius=0.15 style=filled
    legendlabel: MRSW-T-begin
#proc lineplot
    xfield: loc
    yfield: MRSW-T-commit
    linedetails: color=black width=2 style=2 dashscale=4.5
    pointsymbol: shape=circle color=black radius=0.19 linewidth=2
    legendlabel: MRSW-T-commit
#proc lineplot
    xfield: loc
    yfield: MRMW-T-begin
    linedetails: color=black width=4 style=3 dashscale=4.5
    pointsymbol: shape=square color=black radius=0.19 linewidth=2
    legendlabel: MRMW-T-begin
#proc lineplot
    xfield: loc
    yfield: MRMW-C-commit
    linedetails: color=black width=4 style=1 dashscale=4.5
    pointsymbol: shape=triangle color=black radius=0.15 style=filled
    legendlabel: MRMW-C-commit



#proc legend
  format: down
  textdetails: size=18
  location: min+0.8 min+2.2
  seglen: 0.8
  noclear: yes
  specifyorder: MRMW-T-commit
	 	MRSW-T-begin
  		MRSW-T-commit
	 	MRMW-T-begin
#proc legend
  format: down
  textdetails: size=18
  location: min+4.8 min+2.2
  seglen: 0.8
  noclear: yes
  specifyorder: MRMW-C-commit
