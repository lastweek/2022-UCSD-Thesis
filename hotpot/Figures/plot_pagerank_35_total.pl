//Plot from memtrace_powergraph_35th_output.txt, 
//powergraph_35th_sharing_in_time_window_5secv2.txt

#proc page
#if @DEVICE in png,gif
   scale: 1
#endif

#proc settings
enable_suscripts: yes
#proc areadef
   rectangle: 1 1 12 6
   xrange: 1 31
   yrange: 0 8

#proc xaxis
   label: Number of threads
   labeldistance: 0.9
   stubs: inc 5
   stubrange: 5 35
      
#proc yaxis
   label: Number of \nAccesses/Locations
   labeldistance: 1.4
   //selflocatingstubs: text
   selflocatingstubs: text
        2 10^2^
        4   10^4^
        6 10^6^
        8 10^8^


 
 #proc getdata
file: ../Data/data_pagerank_35_total.tab
fieldnames: loc location-global read-global write-global location-5 read-5 write-5
#proc lineplot
    xfield: loc
    yfield: location-global
    linedetails: color=black width=5 style=0 dashscale=4.5
    legendlabel: Total-Locations

#proc lineplot
    xfield: loc
    yfield: read-global
    linedetails: color=black width=5 style=1 dashscale=8.5
    legendlabel: Total-Reads
    
#proc lineplot
    xfield: loc
    yfield: write-global
    linedetails: color=black width=5 style=6 dashscale=8.5
    legendlabel: Total-Writes

#proc lineplot
    xfield: loc
    yfield: location-5
    linedetails: color=green width=5 style=0 dashscale=4.5
    legendlabel: 5sec-Locations

#proc lineplot
    xfield: loc
    yfield: read-5
    linedetails: color=green width=5 style=1 dashscale=8.5
    legendlabel: 5sec-Reads

#proc lineplot
    xfield: loc
    yfield: write-5
    linedetails: color=green width=5 style=6 dashscale=8.5
    legendlabel: 5sec-Writes


#proc legend
  format: down
  location: min+7.5 min+5.4
  seglen: 1.0
  specifyorder:
    Total-Locations
    Total-Reads
    Total-Writes
    5sec-Locations
    5sec-Reads
    5sec-Writes
