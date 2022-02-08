#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc areadef
   rectangle: 1 1 12 6
   xrange: 1 3.2
   yrange: 0 2

#proc xaxis
   label: ExCache Associativity
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=18
   selflocatingstubs: text
      1        16
      2        64
      3        256

#proc yaxis
   label: Slowdown
   labeldistance: 1.0
   labeldetails: size=24
   stubs: inc 0.5
   ##stubdetails: adjust=0,0.2

#proc getdata
file: ../Data/data_LEGO_associativity.tab
fieldnames: loc TF-Perf Phoenix-Perf TF-Misses Phoenix-Misses

#proc lineplot
    xfield: loc
    yfield: TF-Perf
    linedetails: color=blue width=3 style=3 dashscale=7
    pointsymbol: shape=square color=blue radius=0.22 style=filled
    legendlabel: TF-Perf
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: Phoenix-Perf
    relax_xrange:
    linedetails: color=blue width=3 style=3 dashscale=7
    pointsymbol: shape=circle color=blue radius=0.22
    legendlabel: Phoenix-Perf
    legendsampletype: line+symbol

#proc areadef
   rectangle: 1 1 12 6
   xrange: 1 3.2
   yrange: 0 5

#proc yaxis
   location: 3(s)
   label: Num. of Misses (Mil)
   labeldistance: -0.8
   labeldetails: size=18 align=R adjust=0.0,0.2
   stubs: inc 1
   stubdetails: adjust=0.3,0.2 align=L

#proc lineplot
    xfield: loc
    yfield: TF-Misses
    linedetails: color=red width=3 style=0 dashscale=7
    pointsymbol: shape=square color=red radius=0.22 style=filled
    legendlabel: TF-Misses
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: Phoenix-Misses
    relax_xrange:
    linedetails: color=red width=3 style=0 dashscale=7
    pointsymbol: shape=circle color=red radius=0.22
    legendlabel: Phoenix-Misses
    legendsampletype: line+symbol

#proc legend
  format: down
  textdetails: size=18
  location: min+1.5 min+1.5
  seglen: 1.0
  noclear: yes
  specifyorder: TF-Misses
  		TF-Perf

#proc legend
  format: down
  textdetails: size=18
  location: min+5.5 min+1.5
  seglen: 1.0
  noclear: yes
  specifyorder: Phoenix-Misses
  		Phoenix-Perf

