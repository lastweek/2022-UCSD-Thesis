#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.backends.backend_pdf import PdfPages
import operator
import matplotlib.ticker as mtick

fig, ax = plt.subplots(nrows=1, ncols=1, figsize=(10, 6))

#         db, web, hadoop, alibaba
dc_c   = [9.21E+06, 3.98E+07, 1.40E+08, 3.42E+05]
rack_c = [1.81E+08, 4.50E+08, 8.49E+08, 1.10E+07]
no_c   = [1.53E+09, 6.88E+09, 3.69E+09, 1.84E+10]

index = ['FB-DB', 'FB-Web', 'FB-Hadoop', 'Alibaba']
index_pos = np.arange(len(index))

width = 0.2

colors=['tab:blue','tab:orange','tab:red', 'tab:brown']
ax.bar(index_pos - width,  dc_c,   width, label='Datacenter-Conslid', color="tab:blue")
ax.bar(index_pos,          rack_c, width, label='Rack-Consolid',      color="tab:orange")
ax.bar(index_pos + width,  no_c,   width, label='No-Consolid',        color="dimgray")

ax.set_xticks(index_pos)
ax.set_xticklabels(index)
ax.set_ylabel("Peak Traffic (load/sec)", fontsize=22)

ax.yaxis.set_major_formatter(mtick.FormatStrFormatter('%.2e'))
#ax.set_yticks(np.arange(0,20,1E+01))
ax.set_yscale("log")
ax.set_ylim([None, 1.0E+11])

#ax.set_xlabel("")
ax.legend(loc="upper left", fontsize=20, frameon=False)

plt.xticks(fontsize=20)
plt.yticks(fontsize=20)

#plt.tight_layout(pad=0.4, w_pad=0.5, h_pad=1.0)
plt.tight_layout()

#plt.show()
pp = PdfPages('fig_fb_alibaba_trace.pdf')
pp.savefig(bbox_inches = "tight")
pp.close()
