#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 12 6
   xrange: 1 3
   yrange: 1 5

#proc xaxis
   label: ExCache/Memory Size (MB)
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=18
   selflocatingstubs: text
      1        128
      2        256
      3        512

#proc yaxis
   label: Slowdown
   labeldistance: 0.6
   labeldetails: size=24
   stubdetails: size=18
   stubs: inc 1

#proc getdata
file: ../Data/data_LEGO_tf.tab
fieldnames: loc Lego Linux-SSD nbdX Linux-ramdisk InfiniSwap

#proc lineplot
    xfield: loc
    yfield: Lego
    linedetails: color=black width=2 style=0 dashscale=7
    pointsymbol: shape=square color=black radius=0.20 style=filled
    legendlabel: Lego
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: Linux-SSD
    relax_xrange:
    linedetails: color=blue width=2 style=3 dashscale=7
    pointsymbol: shape=square color=blue radius=0.20 style=filled
    legendlabel: Linux-swap-SSD
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: nbdX
    linedetails: color=black width=2 style=1 dashscale=7
    pointsymbol: shape=circle color=black radius=0.20
    legendlabel: nbdX
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: Linux-ramdisk
    relax_xrange:
    linedetails: color=red width=2 style=0 dashscale=7
    pointsymbol: shape=circle color=red radius=0.20
    legendlabel: Linux-swap-ramdisk
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: InfiniSwap
    relax_xrange:
    linedetails: color=green width=2 style=0 dashscale=7
    pointsymbol: shape=diamond color=green radius=0.20
    legendlabel: InfiniSwap
    legendsampletype: line+symbol

#proc legend
  format: down
  textdetails: size=18
  location: min+5.2 min+5
  seglen: 1.0
  noclear: yes
  specifyorder:
  		Linux-swap-SSD
		Linux-swap-ramdisk
  		nbdX
		InfiniSwap
		Lego
