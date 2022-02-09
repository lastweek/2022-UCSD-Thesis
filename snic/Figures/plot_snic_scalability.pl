#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 5
   yrange: 0 2.5

#proc xaxis
   label: Number of Ports
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
	1 1
	2 2
	3 4
	4 8
	5 16

#proc yaxis
   label: Throughput (Tbps)
   labeldistance: 1.3
   labeldetails: size=24
   stubdetails: size=22
   //selflocatingstubs: text
   stubs: inc 0.5

#proc getdata
file: ../Data/data_snic_scalability.tab
fieldnames: port sNIC

#proc lineplot
    xfield: port
    yfield: sNIC
    linedetails: color=black width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=black radius=0.15 style=filled
    legendlabel: sNIC
    legendsampletype: line+symbol
    
#proc legend
  location: 2.5 6
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	sNIC
