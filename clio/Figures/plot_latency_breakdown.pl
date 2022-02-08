#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.5 4.5
   yrange: 0 1500

#proc xaxis
tics: none
stubdetails: size=22
selflocatingstubs: text
        1   R-4B
        2   R-1KB
	3   W-4B
	4   W-1KB

#proc yaxis
label: Latency (ns)
labeldistance: 1.7
stubdetails: size=24
labeldetails: size=24
stubs: inc 300

#proc getdata
file: ../Data/data_latency_breakdown.tab

#proc bars
  lenfield: 2
  barwidth: 0.6
  color: Xff7f00 
  legendlabel: DDRAccess

#proc bars
  lenfield: 3
  barwidth: 0.6
  color: blue
  legendlabel: TLBMiss
  stackfields: *

#proc bars
  lenfield: 4
  barwidth: 0.6
  color: black
  legendlabel: TLBHit
  stackfields: *

#proc bars
  lenfield: 5
  barwidth: 0.6
  color: red
  legendlabel: InterConn
  stackfields: *

#proc bars
  lenfield: 6
  barwidth: 0.6
  color: X4daf4a
  legendlabel: WireDelay
  stackfields: *

#proc legend
  location: min+5.3 max+0.4
  seglen: 0.5
  noclear: yes
  swatchsize: 0.2
  textdetails: size=20
  specifyorder:
  	WireDelay
	InterConn
	TLBHit
	TLBMiss
	DDRAccess
