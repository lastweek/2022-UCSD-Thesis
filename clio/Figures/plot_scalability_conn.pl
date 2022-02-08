#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 6
   yrange: 0 6000

#proc xaxis
   label: Num of Processes
   labeldistance: 1.2
   labeldetails: size=23
   stubdetails: size=23
   selflocatingstubs: text
	1 1
	2 200
	3 400
	4 600
	5 800
	6 1000
      
#proc yaxis
   label: Latency (us)
   labeldistance: 1.1
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 2000
   stubmult: 0.001

#proc getdata
file: ../Data/data_scalability_conn.tab
fieldnames: size RDMA-Read RDMA-Write Clio-Read Clio-Write RDMA-Read-CX5 RDMA-Write-CX5

#proc lineplot
    xfield: size
    yfield: RDMA-Read
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=Xe41a1c radius=0.15 style=filled
    legendlabel: RDMA-Read
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: RDMA-Write
    linedetails: color=Xe41a1c width=4 style=1 dashscale=4.5
    pointsymbol: shape=triangle color=Xe41a1c radius=0.15 style=filled
    legendlabel: RDMA-Write
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: RDMA-Read-CX5
    linedetails: color=green width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=green radius=0.15 style=filled
    legendlabel: RDMA-Read-CX5
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: RDMA-Write-CX5
    linedetails: color=green width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=green radius=0.15 style=filled
    legendlabel: RDMA-Write-CX5
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: Clio-Read
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Clio-Read
    legendsampletype: line

#proc lineplot
    xfield: size
    yfield: Clio-Write
    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Clio-Write
    legendsampletype: line+symbol

#proc legend
  location: 2.2 max+0.2
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	RDMA-Read-CX5
	RDMA-Write-CX5

#proc legend
  location: 2.2 min+1.5
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	RDMA-Read
	RDMA-Write

#proc legend
  location: 6.3 min+1.5
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
  	Clio-Read
	Clio-Write
