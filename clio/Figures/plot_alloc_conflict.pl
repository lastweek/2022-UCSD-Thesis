#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 0 100
   yrange: 0 60

#proc xaxis
   label: Phys Mem Util
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   stubs: inc 25
   # selflocatingstubs: text
   #      1 4
   #      2 16
   #      3 64
   #      4 256
   #      5 512
   #      6 1024
      
#proc yaxis
   label: Num. of Retry
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   stubs: inc 20

 #proc getdata
file: ../Data/data_alloc_conflict.tab
fieldnames: util p1 p10 p100

#proc lineplot
    xfield: util
    yfield: p1
    linedetails: color=Xe41a1c width=3 style=0 dashscale=4.5
    #pointsymbol: shape=circle color=X377eb8 radius=0.15
    legendlabel: 1 page
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: util
    yfield: p10
    linedetails: color=X377eb8 width=3 style=0 dashscale=4.5
    #pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: 10 pages
    legendsampletype: line+symbol


#proc lineplot
    xfield: util
    yfield: p100
    linedetails: color=green width=3 style=0 dashscale=4.5
    #pointsymbol: shape=triangle color=black radius=0.15 style=filled
    legendlabel: 100 pages
    legendsampletype: line

#proc legend
  location: min+1.5 max-0.3
  noclear: yes
  seglen: 0.8
  textdetails: size=24
  specifyorder:
	1 page
	10 pages
	100 pages
