#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 6
   yrange: 0 1.5

#proc xaxis
   label: Number of NTs
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
	1 2
	2 3 
	3 4
	4 5
	5 6
	6 7

#proc yaxis
   label: Latency (us)
   labeldistance: 1.3
   labeldetails: size=24
   stubdetails: size=22
   //selflocatingstubs: text
   stubs: inc 0.5

#proc getdata
file: ../Data/data_nt_parallel.tab
fieldnames: pkt panic all half

#proc lineplot
    xfield: pkt
    yfield: panic
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: PANIC-Emu
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: pkt
    yfield: all
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=X377eb8 radius=0.15 style=filled
    legendlabel: All-Parallel
    legendsampletype: line+symbol

#proc lineplot
    xfield: pkt
    yfield: half
    linedetails: color=X0a6b06 width=4 style=0 dashscale=4.5
    pointsymbol: shape=dimand color=X0a6b06 radius=0.15 style=filled
    legendlabel: Half-Parallel
    legendsampletype: line+symbol


#proc legend
  location: 2.5 6
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	PANIC-Emu
	Half-Parallel
	All-Parallel
