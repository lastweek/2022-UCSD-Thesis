#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc getdata
fieldnameheader: yes
file: ../Data/data_LEGO_excache_tech.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.5 2.5
   yrange: 1 2.5

#proc xaxis
tics: none
labeldistance: 1.0
labeldetails: size=24
stubdetails: size=24
#stubdistance: 2.0
selflocatingstubs: text
	1   1 worker
	2   4 worker

#proc yaxis
label: Slowdown
labeldetails: size=24
stubdetails: size=18
labeldistance: 1.0
stubs: inc 0.5

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
    #showvalues: yes
    labeldetails: align=R size=4
    longwayslabel: yes

    #set I = $arith(@I+1)
    #if @I > 5
        #break
    #endif
#endloop

#proc legend
  location: 1.5 max
  textdetails: size=18
  seglen: 0.8
  swatchsize: 0.3
  noclear: yes
  #format: across
  #separation: 0.7
  specifyorder:
		Piggyback+List+FIFO
  		List+FIFO

#proc legend
  location: 7.1 max
  textdetails: size=18
  seglen: 0.8
  swatchsize: 0.3
  noclear: yes
  #format: across
  #separation: 0.7
  specifyorder:
		List+LRU
		Bitmap+FIFO
