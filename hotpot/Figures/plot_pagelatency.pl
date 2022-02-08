#proc page
#if @DEVICE in png,gif
   scale: 1
#endif
#proc settings
enable_suscripts: yes
#proc getdata
fieldnameheader: yes
file: ../Data/data_pagelatency.tab
#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.5 2.5
   yrange: 0 80

#proc xaxis
tics: none
labeldistance: 0.65
stubs: datafield=1

#proc yaxis
label: Latency (usec)
labeldistance: 0.65
stubs: inc 20

#set I = 2
#set COLORLIST = htach1,grey(0.9),grey(0.6),grey(0.3),black

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
    labeldetails: align=R size=10 adjust=0,0.45
    longwayslabel: yes

    #set I = $arith(@I+1)
    #if @I > 5
        #break
    #endif
#endloop

#proc legend
format: singleline
swatchsize: 0.3
location: 1 0.2
separation: 0.8
