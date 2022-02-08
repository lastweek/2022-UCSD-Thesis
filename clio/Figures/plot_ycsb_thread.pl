#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 4
   yrange: 0 1.2

#proc xaxis
   label: Num of Threads
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
   	1	1
	2	2
	3	4
	4	8
      
#proc yaxis
   label: Throughput (MIOPS)
   labeldistance: 1.4
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 0.2

 #proc getdata
file: ../Data/data_ycsb_thread.tab
fieldnames: size A B C Aphys Bphys Cphys

#proc lineplot
    xfield: size
    yfield: A
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Clio-KV(A)
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: B
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=Xe41a1c radius=0.15 style=filled
    legendlabel: Clio-KV(B)
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: C
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Clio-KV(C)
    legendsampletype: line+symbol


#proc lineplot
    xfield: size
    yfield: Aphys
    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
    pointsymbol: shape=circle color=X377eb8 radius=0.15 style=filled
    legendlabel: Clio-KV-phy(A)
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: Bphys
    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Clio-KV-phy(B)
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: Cphys
    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
    pointsymbol: shape=triangle color=X377eb8 radius=0.15 style=filled
    legendlabel: Clio-KV-phy(C)
    legendsampletype: line+symbol

   
#proc legend
  location: 2.5 6
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Clio-KV-phy(A)
	Clio-KV-phy(B)
	Clio-KV-phy(C)

#proc legend
  location: 6.5 3
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Clio-KV(A)
	Clio-KV(B)
	Clio-KV(C)
