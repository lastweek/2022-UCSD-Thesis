#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 6
   yrange: 0 4000

#proc xaxis
   label: Alloc/Free Size (MB)
   labeldistance: 1.2
   labeldetails: size=20
   stubdetails: size=24
   selflocatingstubs: text
	1 4
	2 16
	3 64
	4 256
	5 512
	6 1024
      
#proc yaxis
   label: Latency (ms)
   labeldistance: 1
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 1000
   stubmult: 0.001

 #proc getdata
file: ../Data/data_alloc_free.tab
fieldnames: size alloc	free	RDMA-Reg RDMA-Dereg RDMA-Reg-ODP RDMA-Dereg-ODP phys

#proc lineplot
    xfield: size
    yfield: alloc
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=X377eb8 radius=0.15
    legendlabel: Clio-Alloc
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: free
    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Clio-Free
    legendsampletype: line+symbol


#proc lineplot
    xfield: size
    yfield: phys
    linedetails: color=black width=4 style=1 dashscale=4.5
    pointsymbol: shape=triangle color=black radius=0.15 style=filled
    legendlabel: Clio-Alloc-Phys
    legendsampletype: line


#proc lineplot
    xfield: size
    yfield: RDMA-Reg
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=Xe41a1c radius=0.15 style=filled
    legendlabel: RDMA-Reg
    legendsampletype: line
#proc lineplot
    xfield: size
    yfield: RDMA-Dereg
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=Xe41a1c radius=0.15 style=filled
    legendlabel: RDMA-Dereg
    legendsampletype: line

#proc lineplot
    xfield: size
    yfield: RDMA-Reg-ODP
    linedetails: color=green width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=green radius=0.15 style=filled
    legendlabel: RDMA-Reg-ODP
    legendsampletype: line
 
#proc lineplot
    xfield: size
    yfield: RDMA-Dereg-ODP
    linedetails: color=green width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=green radius=0.15 style=filled
    legendlabel: RDMA-Dereg-ODP
    legendsampletype: line
   
#proc legend
  location: min+1.2 max+0.4
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	RDMA-Reg
	RDMA-Dereg
	RDMA-Reg-ODP
	RDMA-Dereg-ODP
	Clio-Alloc
	Clio-Free
	Clio-Alloc-Phys
