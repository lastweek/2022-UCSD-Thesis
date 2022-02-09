#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc getdata
fieldnameheader: yes
file: ../Data/data_ycsb_replication.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.1 3.0
   yrange: 0 15

#proc xaxis
tics: none
stubdetails: size=24
labeldetails: size=24
labeldistance: 1.0
selflocatingstubs: text
	1	A
	2	B

#proc yaxis
label: Latency (us)
labeldistance: 1.2
labeldetails: size=24
stubdetails: size=24
stubs: inc 5

#set I = 2

#set COLORLIST = htach1,X0394fc,darkblue,pink,Xe41a1c,X4daf4a,X0a6b06
#set myname = name,Clio,Clio-R,Clio-sNIC,Clio-sNIC-R,Clover,Clover-R

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
  location: 1.5 6.4
  seglen: 0.2
  noclear: yes
  separation: 1.45
  swatchsize: 0.2
  textdetails: size=18
  format: across
  specifyorder:
      Clio
      Clio-sNIC
      Clover

#proc legend
  location: 1.5 6
  seglen: 0.2
  noclear: yes
  separation: 1.1
  swatchsize: 0.2
  textdetails: size=18
  format: across
  specifyorder:
      Clio-R
      Clio-sNIC-R
      Clover-R

