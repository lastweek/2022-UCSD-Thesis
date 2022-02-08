#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 5
   xrange: 1 4
   yrange: 0 600

#proc xaxis
   label: Degree of Replication
   labeldistance: 0.9
   selflocatingstubs: text
      1        1
      2        2
      3        3
      4        4
      
#proc yaxis
   label: Latency (us)
   labeldistance: 1.0
   #selflocatingstubs: text
   stubs: inc 200
    


 
 #proc getdata
file: ../Data/data_FAST_replica.tab
fieldnames: loc MRSW-Begin MRSW-Commit MRMW-Begin MRMW-Commit

#proc lineplot
    xfield: loc
    yfield: MRSW-Commit
    linedetails: color=black width=2 style=0 dashscale=4.5
    pointsymbol: shape=circle color=black radius=0.15 style=filled
    legendlabel: MRSW-T-commit
#proc lineplot
    xfield: loc
    yfield: MRSW-Begin
    linedetails: color=black width=2 style=2 dashscale=4.5
    pointsymbol: shape=square color=black radius=0.18 linewidth=2
    legendlabel: MRSW-T-begin
#proc lineplot
    xfield: loc
    yfield: MRMW-Commit
    linedetails: color=black width=4 style=3 dashscale=4.5
    pointsymbol: shape=circle color=black radius=0.18 linewidth=2
    legendlabel: MRMW-T-commit
#proc lineplot
    xfield: loc
    yfield: MRMW-Begin
    linedetails: color=black width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=black radius=0.15 style=filled
    legendlabel: MRMW-T-begin

#proc legend
  location: min+0.4 min+4.5
  noclear: yes
  specifyorder: MRMW-T-commit
	 	MRSW-T-commit
		MRSW-T-begin
        	MRMW-T-begin
//#proc legend
//  location: min+0.4 min+3.3
//  specifyorder: 
