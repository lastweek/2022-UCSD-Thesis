#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 4
   yrange: 0 3

#proc xaxis
   label: Num of MNs
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
   	1	1
	2	2
	3	3
	4	4
      
#proc yaxis
   label: Throughput (MIOPS)
   labeldistance: 0.8
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 1

 #proc getdata
file: ../Data/data_ycsb_mn.tab
fieldnames: size A B C A2 B2 C2

#proc lineplot
    xfield: size
    yfield: A
    linedetails: color=Xe41a1c width=4 style=0 dashscale=3
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Clio-KV(A)
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: B
    linedetails: color=Xe41a1c width=4 style=1 dashscale=3
    pointsymbol: shape=square color=Xe41a1c radius=0.15 style=filled
    legendlabel: Clio-KV(B)
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: C
    linedetails: color=Xe41a1c width=4 style=0 dashscale=3
    pointsymbol: shape=triangle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Clio-KV(C)
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: A2
    linedetails: color=X377eb8 width=4 style=0 dashscale=3
    pointsymbol: shape=circle color=X377eb8 radius=0.15 style=filled
    legendlabel: Clover(A)
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: B2
    linedetails: color=X377eb8 width=4 style=1 dashscale=3
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Clover(B)
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: C2
    linedetails: color=X377eb8 width=4 style=0 dashscale=3
    pointsymbol: shape=triangle color=X377eb8 radius=0.15 style=filled
    legendlabel: Clover(C)
    legendsampletype: line+symbol

   
#proc legend
  location: 3.4 2.55
  noclear: yes
  seglen: 0.7
  textdetails: size=18
  specifyorder:
       Clio-KV(C)
       Clio-KV(B)
       Clio-KV(A)

#proc legend
  location: 7.5 2.55
  noclear: yes
  seglen: 0.7
  textdetails: size=18
  specifyorder:
       Clover(C)
       Clover(B)
       Clover(A)
