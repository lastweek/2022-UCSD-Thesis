#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 6
   yrange: 0 40

#proc xaxis
   label: Msg Size (Byte)
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=18
   selflocatingstubs: text
      1        128
      2        256
      3        512
      4        1K
      5        2K
      6        4K
     
#proc yaxis
   label: Latency (usec)
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=18
   stubs: inc 10

#proc getdata
file: ../Data/data_LEGO_latency.tab
fieldnames: loc Linux-IPoIB LegoOS-Sock-o-IB LegoOS-RPC-IB

#proc lineplot
    xfield: loc
    yfield: Linux-IPoIB
    relax_xrange:
    linedetails: color=black width=3 style=0 dashscale=7
    pointsymbol: shape=circle color=black radius=0.22
    legendlabel: Linux-IPoIB
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: LegoOS-Sock-o-IB
    linedetails: color=blue width=3 style=0 dashscale=7
    pointsymbol: shape=diamond color=blue radius=0.22 style=filled
    legendlabel: LegoOS-Sock-o-IB
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: LegoOS-RPC-IB
    relax_xrange:
    linedetails: color=red width=3 style=0 dashscale=7
    pointsymbol: shape=triangle color=red radius=0.22
    legendlabel: LegoOS-RPC-IB
    legendsampletype: line+symbol

#proc legend
  format: down
  textdetails: size=18
  location: min+1.5 max
  seglen: 1.0
  noclear: yes
  specifyorder: Linux-IPoIB
  		LegoOS-Sock-o-IB
		LegoOS-RPC-IB
