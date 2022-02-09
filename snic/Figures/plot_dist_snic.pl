#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 5
   yrange: 0 100

#proc xaxis
   label: Timeline
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
	1 64
	2 128
	3 256
	4 512
	5 1024

#proc yaxis
   label: Throughput (Gbps)
   labeldistance: 1.3
   labeldetails: size=24
   stubdetails: size=22
   //selflocatingstubs: text
   stubs: inc 20

#proc getdata
file: ../Data/data_dist_snic.tab
fieldnames: TS sNIC1 sNIC2

#proc lineplot
    xfield: TS
    yfield: sNIC1
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: sNIC1
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: TS
    yfield: sNIC2
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=X377eb8 radius=0.15 style=filled
    legendlabel: sNIC2
    legendsampletype: line+symbol

#proc legend
  location: 2.5 6
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
        sNIC1
	sNIC2

