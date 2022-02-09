#proc page
#if @DEVICE in png,gif
   scale: 1
#endif


#proc areadef
   rectangle: 1 1 10 6
   xrange: 1 4
   yrange: 0 5

#proc xaxis
   label: Packet Size (B)
   labeldistance: 1.2
   labeldetails: size=24
   stubdetails: size=24
   selflocatingstubs: text
	1 128
	2 256
	3 512
	4 1024

#proc yaxis
   label: Throughput (Gbps)
   labeldistance: 1.3
   labeldetails: size=24
   stubdetails: size=22
   //selflocatingstubs: text
   stubs: inc 1

#proc getdata
file: ../Data/data_ovs.tab
fieldnames: pkt Vanilla-OVS OVS-Only OVS-Server-NF OVS-sNIC

#proc lineplot
    xfield: pkt
    yfield: Vanilla-OVS
    linedetails: color=Xe41a1c width=4 style=0 dashscale=4.5
    pointsymbol: shape=circle color=Xe41a1c radius=0.15 style=filled
    legendlabel: Vanilla-no-NT
    legendsampletype: line+symbol
    
#proc lineplot
    xfield: pkt
    yfield: OVS-Only
    linedetails: color=X377eb8 width=3 style=0 dashscale=4.5
    pointsymbol: shape=triangle color=X377eb8 radius=0.25 style=filled
    legendlabel: DPDK-no-NT
    legendsampletype: line+symbol

#proc lineplot
    xfield: pkt
    yfield: OVS-Server-NF
    linedetails: color=X0a6b06 width=3 style=2 dashscale=4.5
    pointsymbol: shape=dimand color=X0a6b06 radius=0.24
    legendlabel: DPDK-w-NT
    legendsampletype: line+symbol

#proc lineplot
    xfield: pkt
    yfield: OVS-sNIC
    linedetails: color=black width=4 style=1 dashscale=4.5
    pointsymbol: shape=circle color=black radius=0.24
    legendlabel: sNIC-w-NT
    legendsampletype: line+symbol

#proc legend
  location: 2.5 6
  noclear: yes
  seglen: 0.8
  textdetails: size=20
  specifyorder:
	Vanilla-no-NT
	DPDK-no-NT
	DPDK-w-NT
	sNIC-w-NT
