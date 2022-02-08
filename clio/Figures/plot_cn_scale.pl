#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 4
   yrange: 0 6

#proc xaxis
   label: Num of CNs
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
   	1	1
	2	2
	3	3
	4	4
      
#proc yaxis
   label: Latency (us)
   labeldistance: 0.8
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 1

 #proc getdata
file: ../Data/data_cn_scale.tab
fieldnames: size Read-16B Write-16B Read-1K Write-1K

#proc lineplot
    xfield: size
    yfield: Read-16B
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Read-16B
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: Write-16B
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Write-16B
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: Read-1K
    linedetails: color=Xe41a1c width=4 style=1 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Read-1KB
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: Write-1K
    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Write-1KB
    legendsampletype: line+symbol

#proc legend
  location: 2.2 2.5
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Read-16B
	Write-16B
 
#proc legend
  location: 7 2.5
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Read-1KB
	Write-1KB
