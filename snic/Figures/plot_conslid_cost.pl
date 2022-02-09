#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc getdata
fieldnameheader: yes
file: ../Data/data_conslid_cost.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.1 3
   yrange: 0 100

#proc xaxis
tics: none
stubdetails: size=20
labeldetails: size=20
labeldistance: 1.0
selflocatingstubs: text
	1	2-devices
	2	4-devices

#proc yaxis
label: Saving (%)
labeldistance: 1.2
labeldetails: size=24
stubdetails: size=24
stubs: inc 20

#set I = 2

#set COLORLIST = htach1,X377eb8,Xe41a1c,X4daf4a,gray(0.5)
#set myname = name,20G,30G,60G,90G

#loop
    #set FNAME = $nmember(@I,@myname)
    #set COLOR = $nmember(@I,@COLORLIST)
    #set I1 = $arith(@I-1)
    #proc bars
    lenfield: @I
    cluster: @I1 / 4
    color: @COLOR
    legendlabel: @FNAME
    barwidth: 0.6
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
  location: 2 6.0
  seglen: 0.2
  noclear: yes
  separation: 0.7
  swatchsize: 0.2
  textdetails: size=20
  format: across
  specifyorder:
	20G
	30G
	60G
	90G
