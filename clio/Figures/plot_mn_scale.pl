#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 4
   yrange: 0 40

#proc xaxis
   label: Num of MNs
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
   	1	1
	2	2
	3	3
	4	4
      
#proc yaxis
   label: Goodput (Gbps)
   labeldistance: 1.1
   labeldetails: size=24
   stubdetails: size=24
   //selflocatingstubs: text
   stubs: inc 10

 #proc getdata
file: ../Data/data_mn_scale.tab
fieldnames: size ClioR ClioW 

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

   
#proc legend
  location: 6.5 3
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Read
	Write
