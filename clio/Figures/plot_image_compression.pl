#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 6
   yrange: 16 22

#proc xaxis
   label: Num of Clients
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
	1 25
	2 100
	3 200
	4 400
	5 600
	6 800

#proc yaxis
   label: Runtime (sec)
   labeldistance: 1.1
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 2

#proc getdata
file: ../Data/data_image_compression.tab
fieldnames: conn RDMA Clio

#proc lineplot
    xfield: conn
    yfield: RDMA
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: RDMA
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: conn
    yfield: Clio
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=X377eb8 radius=0.15 style=filled
    legendlabel: Clio
    legendsampletype: line+symbol

#proc legend
  location: min+2.2 max+0.2
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	RDMA
	Clio
