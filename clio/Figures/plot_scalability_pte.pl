#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 6
   yrange: 0 5000

#proc xaxis
   label: Num of PTE/MR (order of 2)
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
	1 0
	2 4
	3 8
	4 12
	5 18
	6 22

#proc yaxis
   label: Latency (us)
   labeldistance: 1.1
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 1000
   stubmult: 0.001

#proc getdata
file: ../Data/data_scalability_pte.tab
fieldnames: size RDMA-MR RDMA-PTE Clio RDMA-MR-CX5 RDMA-PTE-CX5

#proc lineplot
    xfield: size
    yfield: RDMA-MR
    linerange: 0 5
    relax_xrange:
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=Xe41a1c radius=0.15 style=filled
    legendlabel: RDMA-MR
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: RDMA-PTE
    linedetails: color=Xe41a1c width=4 style=1 dashscale=4.5
    pointsymbol: shape=triangle color=Xe41a1c radius=0.15 style=filled
    legendlabel: RDMA-PTE
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
    yfield: RDMA-MR-CX5
    linerange: 0 5
    relax_xrange:
    linedetails: color=green width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=green radius=0.15 style=filled
    legendlabel: RDMA-MR-CX5
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: RDMA-PTE-CX5
    linedetails: color=green width=4 style=1 dashscale=4.5
    pointsymbol: shape=circle color=green radius=0.15 style=filled
    legendlabel: RDMA-PTE-CX5
    legendsampletype: line+symbol


#proc legend
  location: 2.2 max+0.2
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	RDMA-MR-CX5
	RDMA-PTE-CX5

#proc legend
  location: 2.2 min+1.5
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	RDMA-MR
	RDMA-PTE

#proc legend
  location: 6.3 min+1.5
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
  	Clio
