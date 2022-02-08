#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc getdata
fieldnameheader: yes
file: ../Data/data_LEGO_number_memory_rep.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.5 2.5
   yrange: 1 2.5

#proc xaxis
tics: none
//label: workload
//labeldistance: 0.65
labeldetails: size=24
stubdetails: size=24
selflocatingstubs: text
        1   TensorFlow
        2   Phoenix

#proc yaxis
label: Slowdown
labeldistance: 1.0
labeldetails: size=24
stubs: inc 0.5

#set I = 2
#set COLORLIST = htach1,black,gray(0.8),blue,red,hatch1

#loop
    #set FNAME = $fieldname(@I)
    #set COLOR = $nmember(@I,@COLORLIST)
    #set I1 = $arith(@I-1)

    #proc bars
    lenfield: @I
    cluster: @I1 / 5
    color: @COLOR
    legendlabel: @FNAME
    barwidth: 0.6
//    showvalues: yes
    labeldetails: align=R size=10 adjust=0,0.45
    longwayslabel: yes

    #set I = $arith(@I+1)
    #if @I > 6
        #break
    #endif
#endloop

#proc legend
  location: 6 6.0
  textdetails: size=18
  #seglen: 0.2
  noclear: yes
  swatchsize: 0.3
  specifyorder: 1M
		2M
		2M-Rep

#proc legend
  location: 8.3 6.0
  textdetails: size=18
  #seglen: 0.2
  noclear: yes
  swatchsize: 0.3
  specifyorder: 4M
		4M-Rep
