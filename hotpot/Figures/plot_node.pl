#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 3 //1 8
   yrange: 0 2500 //0 3000

#proc xaxis
   label: Number of nodes
   labeldistance: 0.9
   selflocatingstubs: text
      1        1
      2        4
      3        8
      
#proc yaxis
   label: Latency (usec)
   labeldistance: 1.2
   //selflocatingstubs: text
   stubs: inc 500

 
 #proc getdata
file: ../Data/data_node.tab
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
  location: min+0.6 min+4.35
  noclear: yes

