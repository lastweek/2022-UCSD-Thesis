#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 16
   yrange: 0 10

#proc xaxis
   label: Num of Client Threads
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
   	1	1
	2	2
	4	4
	8	8
	12	12
	16	16
      
#proc yaxis
   label: Goodput (Gbps)
   labeldistance: 1.1
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 2

 #proc getdata
file: ../Data/data_throughput.tab
fieldnames: size rSync wSync rAsync wAsync Max

#proc lineplot
    xfield: size
    yfield: rSync 
    linedetails: color=Xe41a1c width=4 style=1 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Read Sync
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: wSync  
    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Write Sync
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: rAsync
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Read Async
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: wAsync
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Write Async
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: Max
    linedetails: color=black width=4 style=1 dashscale=4.5
    legendlabel: Max-Throughput
    legendsampletype: line+symbol

   
#proc legend
  location: 5.5 4
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Max-Throughput
	Read Sync
	Write Sync
	Read Async
	Write Async
