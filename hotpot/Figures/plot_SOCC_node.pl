#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 7
   xrange: 2 5
   yrange: 0 45

#proc xaxis
   label: Number of Nodes
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=17
   selflocatingstubs: text
      2        2
      3        4
      4        8
      5        16
     
#proc yaxis
   label: K commits per sec
   labeldistance: 1.0
   labeldetails: size=24
   stubs: inc 10

 
#proc getdata
file: ../Data/data_SOCC_node.tab
fieldnames: loc MRSW-commit MRMW-commit

#proc lineplot
    xfield: loc
    yfield: MRSW-commit
    linedetails: color=red width=2 style=3 dashscale=7
    pointsymbol: shape=square color=red radius=0.23 style=filled
    legendlabel: MRSW
    legendsampletype: line+symbol
#proc lineplot
    xfield: loc
    yfield: MRMW-commit
    linedetails: color=green width=4 style=0 dashscale=7
    pointsymbol: shape=triangle color=green radius=0.23 style=filled
    legendlabel: MRMW
    legendsampletype: line+symbol

#proc legend
  format: down
  textdetails: size=20
  location: min+1.5 min+1.2
  seglen: 1.0
  noclear: yes
  specifyorder: MRSW
	 	MRMW

