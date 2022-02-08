#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 4
   yrange: 0 4

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
file: ../Data/data_mvstore.tab
fieldnames: size ReadU WriteU ReadZ WriteZ

#proc lineplot
    xfield: size
    yfield: ReadU
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Read-Uniform
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: WriteU
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Write-Uniform
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: ReadZ
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Read-Zipf
    legendsampletype: line+symbol

#proc lineplot
    xfield: size
    yfield: ReadZ
    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Write-Zipf
    legendsampletype: line+symbol

   
#proc legend
  location: 4.5 4
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Read-Uniform
	Write-Uniform
	Read-Zipf
	Write-Zipf
