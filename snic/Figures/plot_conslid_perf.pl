#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc getdata
fieldnameheader: yes
file: ../Data/data_conslid_perf.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.1 3
   yrange: 0 15

#proc xaxis
tics: none
stubdetails: size=24
labeldetails: size=24
labeldistance: 1.0
selflocatingstubs: text
	1	100G
	2	40G

#proc yaxis
label: IOPS (K)
labeldistance: 1.2
labeldetails: size=24
stubdetails: size=24
stubs: inc 5

#set I = 2

#set COLORLIST = htach1,Xe41a1c,X377eb8
#set myname = name,Baseline,sNIC

#loop
    #set FNAME = $nmember(@I,@myname)
    #set COLOR = $nmember(@I,@COLORLIST)
    #set I1 = $arith(@I-1)
    #proc bars
    lenfield: @I
    cluster: @I1 / 2
    color: @COLOR
    legendlabel: @FNAME
    barwidth: 0.6
    labeldetails: align=R size=10 adjust=0,0.45
    longwayslabel: yes

    # HACK!!!
    # Change the hardcode value if the number of bars change
    # This is the length of myname array plus 1
    #set I = $arith(@I+1)
    #if @I > 3
        #break
    #endif
#endloop

#proc legend
  location: 2 6.3
  seglen: 0.2
  noclear: yes
  separation: 0.1
  swatchsize: 0.2
  textdetails: size=20
  specifyorder:
	Baseline
	sNIC
