
#!/usr/bin/env python
# a bar plot with errorbars
import sys
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
N = 5
menMeans = (26.47850,208.82650,24.58043,4.11586,7.137)
ind = np.arange(N)  # the x locations for the groups
ind = ind + 0.4
width = 0.35       # the width of the bars
fig, ax = plt.subplots(1, figsize=(12,6))
plt.rc('text', usetex=True)
plt.rc('font', family='sans.serif')

rects1 = ax.bar(ind, menMeans, width, color='black')
rects1[4].set_color('green')

# add some text for labels, title and axes ticks
ax.set_ylabel('Latency (msec)', fontsize=36)
ax.set_xticks(ind + width/2 -0.3)
ax.set_xticklabels(('PMFS-J', 'PMFS-F', 'Tmpfs-J', 'Tmpfs-F', 'Hotpot'), rotation=30, fontsize=32)
ax.set_yscale("log", nonposy='clip')
yind = (1,10,100,1000)
ax.set_yticks(yind)
ax.set_yticklabels(('1', '10', '100', '1000'), fontsize=36)
ax.set_ylim([1,1000])
ax.minorticks_off()
# Hide the right and top spines
ax.spines['right'].set_visible(False)
ax.spines['top'].set_visible(False)

# Only show ticks on the left and bottom spines
ax.yaxis.set_ticks_position('left')
ax.xaxis.set_ticks_position('bottom')

plt.tight_layout()
plt.show()
plt.savefig('{}.pdf'.format(sys.argv[1]))
#plt.savefig('{}.eps'.format(sys.argv[1]))
