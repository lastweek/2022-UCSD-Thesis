#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc getdata
fieldnameheader: yes
file: ../Data/data_LEGO_iops_storage.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.2 4.4
   yrange: 0 60

#proc xaxis
tics: none
labeldistance: 1
#labeldetails: size=16
#stubdistance: -1
stubdetails: size=24 adjust=-0.5,0
selflocatingstubs: text
	1   RandW
	2   RandR
	3   SeqW
	4   SeqR

#proc yaxis
label: KIOPS
labeldetails: size=24
stubdetails: size=24
labeldistance: 1.0
stubs: inc 20

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
    #if @I > 3
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
  specifyorder:
		Linux
  		LegoOS
