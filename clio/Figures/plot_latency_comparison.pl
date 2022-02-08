#
# This script plot the latency comparison between RDMA and Clio,
# for normal, TLB miss, pgfault during 16B read/write.
#

#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc getdata
fieldnameheader: yes
file: ../Data/data_latency_comparison.tab

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.45 2.5
   yrange: 0 5

#proc xaxis
tics: none
stubdetails: size=24
labeldetails: size=24
labeldistance: 1.0
selflocatingstubs: text
	1	Read
	2	Write

#proc yaxis
label: Latency (us)
labeldistance: 1.2
labeldetails: size=24
stubdetails: size=24
stubs: inc 1

#set I = 2

#set COLORLIST = htach1,darkblue,X033dfc,X0394fc,skyblue,black,Xe41a1c,magenta,coral,pink
#set myname = name,Clio-ASIC,Clio-TLB-hit,Clio-TLB-miss,Clio-pgfault,EMPTY,RDMA-TLB-hit,RDMA-TLB-miss,RDMA-MR-miss,RDMA-pgfault

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
    #if @I > 10
        #break
    #endif
#endloop

#proc legend
  location: 1.5 6.2
  seglen: 0.1
  noclear: yes
  #separation: 0.5
  swatchsize: 0.2
  textdetails: size=16
  #format: across
  specifyorder:
  	Clio-ASIC
  	Clio-TLB-hit
	Clio-TLB-miss
	Clio-pgfault

#proc legend
  location: 5.7 6.2
  seglen: 0.2
  noclear: yes
  #separation: 0.9
  swatchsize: 0.2
  textdetails: size=16
  #format: across
  specifyorder:
  	RDMA-TLB-hit
	RDMA-TLB-miss
	RDMA-MR-miss
	RDMA-pgfault
