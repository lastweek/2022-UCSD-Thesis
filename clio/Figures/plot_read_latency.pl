#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 6
   yrange: 0 10

#proc xaxis
   label: Request Size (B)
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
	1 4
	2 16
	3 64
	4 256
	5 1K
	6 4K
      
#proc yaxis
   label: Latency (us)
   labeldistance: 1.1
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 2

 #proc getdata
file: ../Data/data_read_latency.tab
fieldnames: size Clio RDMA	Clover	HERD	HERDBF  LegoOS

#proc lineplot
    xfield: size
    yfield: RDMA
    linedetails: color=black width=4 style=1 dashscale=4.5
    legendlabel: RDMA
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: Clio 
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Clio
    legendsampletype: line+symbol


#proc lineplot
    xfield: size
    yfield: Clover
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Clover
    legendsampletype: line

#proc lineplot
    xfield: size
    yfield: HERD
    linedetails: color=green width=4 style=1 dashscale=4.5
    pointsymbol: shape=triangle color=green radius=0.15 style=filled
    legendlabel: HERD
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: HERDBF
    linedetails: color=green width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=green radius=0.15 style=filled
    legendlabel: HERD-BF
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: LegoOS
    linedetails: color=black width=4 style=0 dashscale=4.5
    legendlabel: LegoOS
    legendsampletype: line


#proc legend
  location: min+1.7 max+0.2
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Clio
	Clover
	RDMA

#proc legend
  location: min+5.0 max+0.2
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	HERD-BF
	HERD
	LegoOS
