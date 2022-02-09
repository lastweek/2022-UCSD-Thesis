#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 5
   yrange: 0 128

#proc xaxis
   label: Packet Size (B)
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
   stubs: inc 25

#proc getdata
file: ../Data/data_credit.tab
fieldnames: pkt 1c 2c 4c 8c

#proc lineplot
    xfield: pkt
    yfield: 1c
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: 1 credit
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: pkt
    yfield: 2c
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=X377eb8 radius=0.15 style=filled
    legendlabel: 2 credit
    legendsampletype: line+symbol

#proc lineplot
    xfield: pkt
    yfield: 4c
    linedetails: color=X0a6b06 width=4 style=0 dashscale=4.5
    pointsymbol: shape=dimand color=X0a6b06 radius=0.15 style=filled
    legendlabel: 4 credit
    legendsampletype: line+symbol

#proc lineplot
    xfield: pkt
    yfield: 8c
    linedetails: color=black width=4 style=0 dashscale=4.5
    pointsymbol: shape=dimand color=black radius=0.15 style=filled
    legendlabel: 8 credit
    legendsampletype: line+symbol


#proc legend
  location: 7.5 3.5
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	8 credit
	4 credit
	2 credit
	1 credit

