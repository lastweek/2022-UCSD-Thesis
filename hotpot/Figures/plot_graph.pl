#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc getdata
fieldnameheader: yes
file: ../Data/data_graph.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 6 6
   xrange: 0.5 2.5
   yrange: 0 40

#proc xaxis
tics: none
//label: workload
//labeldistance: 0.65
selflocatingstubs: text
        1   LiveJournal
        2   GPlus

#proc yaxis
label: Total Run Time (sec)
labeldistance: 0.8
stubs: inc 10

#set I = 2
#set COLORLIST = htach1,black,green

#loop
    #set FNAME = $fieldname(@I)
    #set COLOR = $nmember(@I,@COLORLIST)
    #set I1 = $arith(@I-1)

    #proc bars
    lenfield: @I
    cluster: @I1 / 2
    color: @COLOR
    legendlabel: @FNAME
    barwidth: 0.5
//    showvalues: yes
    labeldetails: align=R size=10 adjust=0,0.45
    longwayslabel: yes

    #set I = $arith(@I+1)
    #if @I > 3
        #break
    #endif
#endloop

#proc legend
format: singleline
swatchsize: 0.3
location: 1.3 0.2
separation: 0.8
