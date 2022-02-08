#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc getdata
fieldnameheader: yes
file: ../Data/data_ycsb_cn2.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.5 3.5
   yrange: 0 40

#proc xaxis
tics: none
stubdetails: size=24
labeldetails: size=24
labeldistance: 1.0
selflocatingstubs: text
	1	A
	2	B
	3	C


#proc yaxis
label: Latency (us)
labeldistance: 1.2
labeldetails: size=24
stubdetails: size=24
stubs: inc 10

#set I = 2

#set COLORLIST = htach1,X377eb8,Xe41a1c,X4daf4a,gray(0.5)
#set myname = name,Clio,Clover,HERD,HERD-BF

#loop
    #set FNAME = $nmember(@I,@myname)
    #set COLOR = $nmember(@I,@COLORLIST)
    #set I1 = $arith(@I-2)
    #proc bars
    lenfield: @I
    cluster: @I1 / 4
    color: @COLOR
    legendlabel: @FNAME
    barwidth: 0.3
    labeldetails: align=R size=10 adjust=0,0.45
    longwayslabel: yes

    # HACK!!!
    # Change the hardcode value if the number of bars change
    # This is the length of myname array plus 1
    #set I = $arith(@I+1)
    #if @I > 5
        #break
    #endif
#endloop

#proc legend
  location: 1.5 6.3
  seglen: 0.2
  noclear: yes
  separation: 0.9
  swatchsize: 0.2
  textdetails: size=18
  format: across
  specifyorder:
      Clio
      Clover
      HERD
      HERD-BF
