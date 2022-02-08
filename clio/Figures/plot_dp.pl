#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#intrailer
#endproc

#proc areadef
   rectangle: 1 1 10 6
   xrange: 0.5 6.5
   yrange: 4 7

#proc xaxis
tics: none
label: Select Ratio (%)
labeldistance: 1.2
labeldetails: size=24
stubdetails: size=20
selflocatingstubs: text
        1   80
        2   40
	3   20
	4   10
	5   5
	6   2

#proc yaxis
label: Runtime (sec)
labeldistance: 0.7
labeldetails: size=24
stubdetails: size=20
stubs: inc 1

#proc getdata
file: ../Data/data_dp.tab

#proc bars
  lenfield: 4
  barwidth: 0.3
  cluster: 1 / 2
  color: skyblue
  legendlabel: Clio-CN

#proc bars
  lenfield: 3
  barwidth: 0.3
  cluster: 1 / 2
  color: X0394fc
  legendlabel: Clio-Filter
  stackfields: *

#proc bars
  lenfield: 2
  barwidth: 0.3
  cluster: 1 / 2
  color: darkblue
  legendlabel: Clio-Avg
  stackfields: *

#proc bars
  lenfield: 6
  barwidth: 0.3
  cluster: 2 / 2
  color: coral
  legendlabel: RDMA-CN

#proc bars
  lenfield: 5
  barwidth: 0.3
  cluster: 2 / 2
  color: Xe41a1c
  legendlabel: RDMA-Comm
  stackfields: *

#proc legend
  location: 1.8 6
  seglen: 0.2
  noclear: yes
  #separation: 0.9
  swatchsize: 0.2
  textdetails: size=18
  specifyorder:
	Clio-Avg
	Clio-Filter
	Clio-CN

#proc legend
  location: 5.4 6
  seglen: 0.2
  noclear: yes
  #separation: 0.9
  swatchsize: 0.2
  textdetails: size=18
  specifyorder:
	RDMA-Comm
	RDMA-CN
