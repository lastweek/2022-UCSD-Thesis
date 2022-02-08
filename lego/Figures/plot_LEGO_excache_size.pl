#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 7
   xrange: 1 4
   #yscaletype: log
   yrange: 0 12

#proc xaxis
   label: ExCache/Memory Size (MB)
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=18
   selflocatingstubs: text
      1        128
      2        256
      3        512
      4        1024
     
#proc yaxis
   label: Slowdown
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=18
   stubs: inc 1

#proc getdata
file: ../Data/data_LEGO_excache_size.tab
fieldnames: loc TF-Lego Phoenix-Lego TF-Linux Phoenix-Linux TF-IS Phoenix-IS

#proc lineplot
    xfield: loc
    yfield: TF-Lego
    linedetails: color=blue width=2 style=3 dashscale=7
    pointsymbol: shape=square color=blue radius=0.20 style=filled
    legendlabel: TF-Lego
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: Phoenix-Lego
    relax_xrange:
    linedetails: color=red width=2 style=0 dashscale=7
    pointsymbol: shape=square color=red radius=0.20 style=filled
    legendlabel: Phoenix-Lego
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: TF-Linux
    linedetails: color=blue width=2 style=0 dashscale=7
    pointsymbol: shape=circle color=blue radius=0.20
    legendlabel: TF-Linux
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: Phoenix-Linux
    relax_xrange:
    linedetails: color=red width=2 style=0 dashscale=7
    pointsymbol: shape=circle color=red radius=0.20
    legendlabel: Phoenix-Linux
    legendsampletype: line+symbol

#proc lineplot
#    xfield: loc
#    yfield: TF-IS
#    relax_xrange:
#    linedetails: color=green width=2 style=5 dashscale=7
#    pointsymbol: shape=square color=green radius=0.10 style=filled
#    legendlabel: TF-IS
#    legendsampletype: line+symbol

#proc lineplot
#    xfield: loc
#    yfield: Phoenix-IS
#    relax_xrange:
#    linedetails: color=red width=2 style=5 dashscale=7
#    pointsymbol: shape=square color=red radius=0.10
#    legendlabel: Phoenix-IS
#    legendsampletype: line+symbol

#proc legend
  format: down
  textdetails: size=14
  location: min+2.5 min+6
  seglen: 1.0
  noclear: yes
  specifyorder: TF-Lego
  		TF-Linux

#proc legend
  format: down
  textdetails: size=14
  location: min+6 min+6
  seglen: 1.0
  noclear: yes
  specifyorder: Phoenix-Lego
		Phoenix-Linux
