#proc page
#if @DEVICE in png,gif
   scale: 1
#endif
#proc settings
enable_suscripts: yes
#proc getdata
fieldnameheader: yes
file: ../Data/data_YCSB_load_latency_logscale.tab
#intrailer
#endproc

#proc areadef
   rectangle: 1 1 12 6
   xrange: 0.5 5.5
   yrange: 0 3

#proc xaxis
tics: none
label: 
labeldistance: 1.0
stubs: datafield=1
stubvert: 350
stubslide: 0.8
#proc xaxis
stubs: inc 1 day
stubformat: Mmmdd

stubdetails: adjust=0,-0.14

#proc yaxis
label: Latency (msec)
labeldistance: 0.9
selflocatingstubs: text
        0   1
        1   10
        2   100
        3   1000

#set I = 2
#set COLORLIST = htach1,grey(0.3),grey(0.6),grey(0.9),black,green

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
    labeldetails: align=left size=10
    longwayslabel: yes
    labelpos: min-0.6

    #set I = $arith(@I+1)
    #if @I > 1
        #break
    #endif
#endloop
