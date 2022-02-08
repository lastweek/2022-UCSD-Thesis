#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 4
   yrange: 0 90

#proc xaxis
   label: Num of Pointer Chasing
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
   	1	1
	2	4
	3	16
	4	32
      
#proc yaxis
   label: Latency (us)
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 30

 #proc getdata
file: ../Data/data_pointer_chasing.tab
fieldnames: size Clio-PC Clio-Read 1_RDMA 2_RDMA

#proc lineplot
    xfield: size
    yfield: Clio-PC
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=Xe41a1c radius=0.15 style=filled
    legendlabel: Clio-PC
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: Clio-Read
    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
    pointsymbol: shape=triangle color=X377eb8 radius=0.15 style=filled
    legendlabel: Clio-Read
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: 1_RDMA
    linedetails: color=green width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=green radius=0.15 style=filled
    legendlabel: One-sided-RDMA
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: 2_RDMA
    linedetails: color=black width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=black radius=0.15 style=filled
    legendlabel: Two-sided-RDMA
    legendsampletype: line+symbol

#proc legend
  location: 2.5 6
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Clio-Read
  	One-sided-RDMA
        Clio-PC
	Two-sided-RDMA
