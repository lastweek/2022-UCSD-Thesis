#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 8
   yrange: 0 120

#proc xaxis
   label: Request Size (B)
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
   	1	64
	2	128
	3	256
	4	512
	5	1K
	6	2K
	7	4K
	8	8K
      
#proc yaxis
   label: Goodput (Gbps)
   labeldistance: 1.3
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 20

 #proc getdata
file: ../Data/data_onboard_throughput.tab
fieldnames: size ClioR ClioW ClioRG ClioWG

#proc lineplot
    xfield: size
    yfield: ClioR
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Read
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: size
    yfield: ClioW
    linedetails: color=X377eb8 width=4 style=0 dashscale=4.5
    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
    legendlabel: Write
    legendsampletype: line+symbol

//#proc lineplot
//    xfield: size
//    yfield: ClioRG
//    linedetails: color=Xe41a1c width=4 style=1 dashscale=4.5
//    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
//    legendlabel: Read-32C
//    legendsampletype: line+symbol
    
//#proc lineplot
//    xfield: size
//    yfield: ClioWG
//    linedetails: color=X377eb8 width=4 style=1 dashscale=4.5
//    pointsymbol: shape=square color=X377eb8 radius=0.15 style=filled
//    legendlabel: Write-32C
//    legendsampletype: line+symbol

#proc legend
//  location: 2 6
  location: 7.5 2.5
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Read
	Write
   
//#proc legend
//  location: 7.5 2.5
//  noclear: yes
//  seglen: 0.8
//  textdetails: size=20
//  specifyorder:
//	Read-32C
//	Write-32C
