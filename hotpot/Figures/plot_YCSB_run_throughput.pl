#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc getdata
fieldnameheader: yes
file: ../Data/data_YCSB_run_throughput_RAW.tab
#intrailer
#endproc

#proc areadef
   rectangle: 1 1 12 3
   xrange: 0.7 6.7
   yrange: 0 14

#proc xaxis
tics: none
//label: workload
//labeldistance: 0.3
selflocatingstubs: text
        1   A
        2   B
        3   C
        4   D
        5   E
        6   F

#proc yaxis
label: Throughput\n(KIOPS)
labeldistance: 1.0
stubs: inc 4
labeldetails: size=12
//darker grey, white, light grey, darkest grey, black, green
#set I = 2
#set COLORLIST = hatch1,grey(0.5),white,grey(0.7),grey(0.2),skyblue,magenta,teal
#loop
    #set FNAME = $fieldname(@I)
    #set COLOR = $nmember(@I,@COLORLIST)
    #set I1 = $arith(@I-1)

    #proc bars
    lenfield: @I
    cluster: @I1 / 4
    color: @COLOR
    legendlabel: @FNAME
    barwidth: 0.2
//    showvalues: yes
    labeldetails: align=R size=10 adjust=0,0.45
    longwayslabel: yes

    #set I = $arith(@I+1)
    #if @I > 8
        #break
    #endif
#endloop

#proc legend
format: singleline
textdetails: size=14
swatchsize: 0.18
noclear: yes
location: 0.4 0.5
separation: 0.6
