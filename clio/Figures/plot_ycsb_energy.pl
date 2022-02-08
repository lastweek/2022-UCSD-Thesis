#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.5 3.5
   yrange: 0 3

#proc xaxis
tics: none
stubdetails: size=24
selflocatingstubs: text
        1   A
        2   B
	3   C

#proc yaxis
label: Energy/Req (mJ)
labeldistance: 0.7
labeldetails: size=24
stubdetails: size=24
stubs: inc 1

#proc getdata
file: ../Data/data_ycsb_energy.tab

#proc bars
  lenfield: 2
  barwidth: 0.4
  cluster: 1 / 4
  color: X0394fc
  legendlabel: Clio

#proc bars
  lenfield: 6
  barwidth: 0.4
  cluster: 1 / 4
  color: darkblue
  legendlabel: Clio-MN
  stackfields: *

#proc bars
  lenfield: 3
  barwidth: 0.4
  cluster: 2 / 4
  color: Xe41a1c
  legendlabel: Clover

#proc bars
  lenfield: 7
  barwidth: 0.4
  cluster: 2 / 4
  color: pink
  legendlabel: Clover-MN
  stackfields: *

#proc bars
  lenfield: 4
  barwidth: 0.4
  cluster: 3 / 4
  color: X4daf4a
  legendlabel: HERD

#proc bars
  lenfield: 8
  barwidth: 0.4
  cluster: 3 / 4
  color: X0a6b06
  legendlabel: HERD-MN
  stackfields: *

#proc bars
  lenfield: 5
  barwidth: 0.4
  cluster: 4 / 4
  color: gray(0.5)
  legendlabel: HERD-BF
#proc bars
  lenfield: 9
  barwidth: 0.4
  cluster: 4 / 4
  color: gray(0.2)
  legendlabel: HERD-BF-MN
  stackfields: *


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
