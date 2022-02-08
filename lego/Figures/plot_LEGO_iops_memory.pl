#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 8
   xscaletype: log
   yscaletype: log
   yrange: 0 8000

#proc xaxis
   label: Num of Workload Threads
   labeldistance: 1.0
   labeldetails: size=24
   stubdetails: size=18
   selflocatingstubs: text
      1        1
      4        4
      8        8

#proc yaxis
   label: KIOPS
   labeldistance: 1.3
   labeldetails: size=24
   stubdetails: size=18
   selflocatingstubs: text
      1        1
      100        100
      1000        1000
      8000	8000
#  stubs: inc 100
#  stubcull: 0.2
#  stubevery: 1
#  stubomit: 200 300 400 600 700 800 900 1100 1200 1300 1700 1800 1900 2100 2300 2200 2400 2600 2700 2900 3100 3300 4800 5800
  #firststub: 100
#  laststub:  7600
  #stubs: list 100\\n500\\n1000\\n2000\\n4000\\n6000\\n8000
  #stubreverse: yes

#proc getdata
file: ../Data/data_LEGO_iops.tab
fieldnames: loc 1w 2w 4w 2m2w Linux Zerofill

#proc lineplot
    xfield: loc
    yfield: Linux
    relax_xrange:
    linedetails: color=blue width=2 style=3 dashscale=7
    pointsymbol: shape=square color=blue radius=0.20 style=filled
    legendlabel: Linux
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: Zerofill
    linedetails: color=black width=2 style=1 dashscale=7
    pointsymbol: shape=circle color=black radius=0.20
    legendlabel: p-local
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: 2m2w
    linedetails: color=blue width=2 style=1 dashscale=7
    pointsymbol: shape=diamand color=blue radius=0.20
    legendlabel: 2M x 2-worker
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: 4w
    linedetails: color=black width=2 style=0 dashscale=7
    pointsymbol: shape=square color=black radius=0.20 style=filled
    legendlabel: 1M x 4-worker
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: 2w
    relax_xrange:
    linedetails: color=red width=2 style=0 dashscale=7
    pointsymbol: shape=circle color=red radius=0.20
    legendlabel: 1M x 2-worker
    legendsampletype: line+symbol

#proc lineplot
    xfield: loc
    yfield: 1w
    relax_xrange:
    linedetails: color=green width=2 style=0 dashscale=7
    pointsymbol: shape=diamond color=green radius=0.20
    legendlabel: 1M x 1-worker
    legendsampletype: line+symbol

#proc legend
  format: down
  textdetails: size=18
  location: 2.3 3.5
  seglen: 0.8
  noclear: yes
  specifyorder:
		1M x 4-worker
		2M x 2-worker
		1M x 2-worker
		1M x 1-worker

#proc legend
  format: down
  textdetails: size=18
  location: 7.5 3.5
  seglen: 0.8
  noclear: yes
  specifyorder:
		Linux
		p-local
