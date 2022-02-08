#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc getdata
fieldnameheader: yes
file: ../Data/data_graph_ATC_runtime.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 8 5
   xrange: 0.5 3.5
   yrange: 0 10

#proc xaxis
tics: none
//label: workload
//labeldistance: 0.65
selflocatingstubs: text
        1   4Nx4T
        2   7Nx4T
	3   7Nx8T

#proc yaxis
label: Run Time (min)
labeldistance: 0.9
stubs: inc 2

#set I = 2
#set COLORLIST = htach1,black,gray(0.8),skyblue,magenta,teal

#loop
    #set FNAME = $fieldname(@I)
    #set COLOR = $nmember(@I,@COLORLIST)
    #set I1 = $arith(@I-1)

    #proc bars
    lenfield: @I
    cluster: @I1 / 4
    color: @COLOR
    legendlabel: @FNAME
    barwidth: 0.3
//    showvalues: yes
    labeldetails: align=R size=10 adjust=0,0.45
    longwayslabel: yes

    #set I = $arith(@I+1)
    #if @I > 6
        #break
    #endif
#endloop

#proc legend
  location: max-2.5 max
  seglen: 0.2
  swatchsize: 0.3
