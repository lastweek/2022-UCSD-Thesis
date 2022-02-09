#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc getdata
fieldnameheader: yes
file: ../Data/data_ycsb_throughput.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.5 3.5
   yrange: 0 15

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
label: Throughput (Gbps)
labeldistance: 1.2
labeldetails: size=24
stubdetails: size=24
stubs: inc 5

#set I = 2

#set COLORLIST = htach1,X377eb8,Xe41a1c,X4daf4a,purple,blue,gray(0.5)
#set myname = name,Clio,Clio-sNIC,Clio-sNIC-$,Clover,HERD,HERD-BF

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
    #if @I > 7
        #break
    #endif
#endloop

#proc legend
  location: 2 6.4
  seglen: 0.2
  noclear: yes
  separation: 0.1
  swatchsize: 0.2
  textdetails: size=18
  specifyorder:
      Clio
      Clio-sNIC
      Clio-sNIC-$

#proc legend
  location: 6 6.4
  seglen: 0.2
  noclear: yes
  separation: 0.1
  swatchsize: 0.2
  textdetails: size=18
  specifyorder:
      Clover
      HERD
      HERD-BF

