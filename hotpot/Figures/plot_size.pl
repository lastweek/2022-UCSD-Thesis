#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 4
   yrange: 0 500

#proc xaxis
   label: Size of areas
   labeldistance: 0.9
   selflocatingstubs: text
      1      0.5K
      2        1K
      3        4K
      4        8K
      
#proc yaxis
   label: Latency (usec)
   labeldistance: 1
   //selflocatingstubs: text
   stubs: inc 100


 
 #proc getdata
file: ../Data/data_size.tab
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
  location: min+1.2 min+5.0
  noclear: yes
  specifyorder: MRMW-Begin
	 	MRMW-Commit
#proc legend
  location: min+4.2 min+5.0
  specifyorder: MRSW-Begin
        MRSW-Commit

  
