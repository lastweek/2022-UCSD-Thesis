#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 7
   xrange: 1 5
   yrange: 0 250

#proc xaxis
   label: Chunk Size (MB)
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=17
   selflocatingstubs: text
      1        1
      2        4
      3        8
      4        16
      5        32
     
#proc yaxis
   label: Commit Latency (us)
   labeldistance: 1.0
   labeldetails: size=24
   stubs: inc 50

#proc getdata
file: ../Data/data_SOCC_chunksize.tab
fieldnames: loc MRSW_1 MRSW_2 MRMW_1 MRMW_2

#proc lineplot
    xfield: loc
    yfield: MRSW_1
    linedetails: color=red width=4 style=0 dashscale=7
    pointsymbol: shape=square color=red radius=0.22 style=filled
    legendlabel: MRSW_1
    legendsampletype: line+symbol
#proc lineplot
    xfield: loc
    yfield: MRSW_2
    linerange: 3
    relax_xrange:
    linedetails: color=black width=3 style=3 dashscale=7
    pointsymbol: shape=circle color=black radius=0.22
    legendlabel: MRSW_2
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: MRMW_1
    linedetails: color=blue width=4 style=0 dashscale=7
    pointsymbol: shape=diamond color=blue radius=0.22 style=filled
    legendlabel: MRMW_1
    legendsampletype: line+symbol
#proc lineplot
    xfield: loc
    yfield: MRMW_2
    linerange: 3
    relax_xrange:
    linedetails: color=green width=2 style=5 dashscale=7
    pointsymbol: shape=triangle color=green radius=0.22
    legendlabel: MRMW_2
    legendsampletype: line+symbol

#proc legend
  format: down
  textdetails: size=20
  location: min+2.0 min+2.5
  seglen: 1.0
  noclear: yes
  specifyorder: MRMW_1
  		MRSW_1
	 	MRMW_2
		MRSW_2

