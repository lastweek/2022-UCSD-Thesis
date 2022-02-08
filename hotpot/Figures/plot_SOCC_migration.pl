#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 7
   xrange: 1 4
   yrange: 0 80

#proc xaxis
   label: Replication Degree
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=17
   selflocatingstubs: text
      1        1
      2        2
      3        3
      4        4
     
#proc yaxis
   label: Improvement (%)
   labeldistance: 1.0
   labeldetails: size=24
   stubs: inc 20

 
#proc getdata
file: ../Data/data_SOCC_migration.tab
fieldnames: loc MRSW MRMW

#proc lineplot
    xfield: loc
    yfield: MRSW
    linedetails: color=red width=2 style=3 dashscale=7
    pointsymbol: shape=square color=red radius=0.25 style=filled
    legendlabel: MRSW
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: MRMW
    linedetails: color=green width=4 style=0 dashscale=7
    pointsymbol: shape=triangle color=green radius=0.25 style=filled
    legendlabel: MRMW
    legendsampletype: line+symbol

#proc legend
  format: down
  textdetails: size=20
  location: min+2.0 min+5.7
  seglen: 1.0
  noclear: yes
  specifyorder: MRMW
  		MRSW

