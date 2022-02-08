#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc getdata
fieldnameheader: yes
file: ../Data/data_LEGO_parsec.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.2 3.35
   yrange: 1 2

#proc xaxis
tics: none
labeldistance: 1.0
#labeldetails: size=20
#stubdistance: 2.2
stubdetails: size=24 adjust=-0.5,0
selflocatingstubs: text
	1   SC
	2   Freqmine
	3   BS

#proc yaxis
label: Slowdown
labeldetails: size=24
stubdetails: size=24
labeldistance: 1.0
stubs: inc 0.5
labeldistance: 1.3

#set I = 2
#set COLORLIST = htach1,black,gray(0.8),blue,red,gray(0.3)

#loop
    #set FNAME = $fieldname(@I)
    #set COLOR = $nmember(@I,@COLORLIST)
    #set I1 = $arith(@I-1)

    #proc bars
    lenfield: @I
    cluster: @I1 / 4
    color: @COLOR
    legendlabel: @FNAME
    barwidth: 0.6
//    showvalues: yes
    labeldetails: align=R size=4
    longwayslabel: yes

    #set I = $arith(@I+1)
    #if @I > 4
        #break
    #endif
#endloop

#proc legend
  location: 2 max
  textdetails: size=18
  seglen: 0.2
  swatchsize: 0.3
  noclear: yes
  #format: across
  specifyorder: 1-workload-thread
		4-workload-thread
