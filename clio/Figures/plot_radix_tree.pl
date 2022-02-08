#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 6
   yrange: 0 160

#proc xaxis
   label: Num of Thousands Entries
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
	1 10
	2 50
	3 100
	4 250
	5 500
	6 1000
      
#proc yaxis
   label: Latency (us)
   labeldistance: 1.1
   labeldetails: size=24
   stubdetails: size=20
   //selflocatingstubs: text
   stubs: inc 40

 #proc getdata
file: ../Data/data_radix_tree.tab
fieldnames: size Clio	RDMA

#proc lineplot
    xfield: size
    yfield: RDMA
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=Xe41a1c radius=0.15 style=filled
    legendlabel: RDMA
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: Clio
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
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
