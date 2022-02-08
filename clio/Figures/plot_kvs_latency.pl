#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 6
   yrange: 0 6

#proc xaxis
   label: Value Size (B)
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
	1 4
	2 16
	3 64
	4 256
	5 1K

#proc yaxis
   label: Latency (us)
   labeldistance: 0.8
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 2

 #proc getdata
file: ../Data/data_kvs_latency.tab
fieldnames: size Read Read-Phy Write Write-Phy

#proc lineplot
    xfield: size
    yfield: Read
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Clio-KV(GET)
    legendsampletype: line

#proc lineplot
    xfield: size
    yfield: Write
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Clio-KV(SET)
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: Read-Phy
    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Clio-KV-phy(GET)
    legendsampletype: line+symbol


#proc lineplot
    xfield: size
    yfield: Write-Phy
    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Clio-KV-phy(SET)
    legendsampletype: line+symbol

#proc legend
  location: min+3.5 min+2.3
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Clio-KV(GET)
	Clio-KV(SET)
	Clio-KV-phy(GET)
	Clio-KV-phy(SET)
