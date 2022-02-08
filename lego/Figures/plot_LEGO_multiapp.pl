#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc getdata
fieldnameheader: yes
file: ../Data/data_LEGO_multiapp.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 16 6
   xrange: 0.2 4.4
   yrange: 1 5

#proc xaxis
tics: none
labeldistance: 1
labeldetails: size=22 adjust=0.03,0.1
#stubdistance: -1
stubdetails: size=24 adjust=-0.8,0.23
selflocatingstubs: text
	1   2P1M-4W
	2   2P1M-8W
	3   1P2M-1GB
	4   1P2M-0.5GB

#proc yaxis
label: Slowdown
labeldetails: size=24
stubdetails: size=24
labeldistance: 1.0
stubs: inc 1

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
    barwidth: 0.8
//    showvalues: yes
    labeldetails: align=R size=4
    longwayslabel: yes

    #set I = $arith(@I+1)
    #if @I > 3
        #break
    #endif
#endloop

#proc legend
  location: 10 max+0.2
  textdetails: size=24
  seglen: 0.2
  swatchsize: 0.5
  noclear: yes
  #format: across
  specifyorder:
  		TensorFlow
		Phoenix
