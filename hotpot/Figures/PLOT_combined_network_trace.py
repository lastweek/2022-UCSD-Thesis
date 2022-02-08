"""
This script takes the output from hotpot-grappa-networktrace.py
The file is in this format
==============================
total network bytes: 102427 MB
total time: 1918 seconds
5566,2,3,4,5,6,7......,87878
==============================
"""



#python hotpot-combine-networktrace.py --readfile1 graphlab --title1 graphlab --output test --readfile2 grappa-4 --title2 grappa-4
import numpy as np
#from scipy import stats
import sys
import argparse
import time
import math
import pickle
import copy
from collections import defaultdict
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
GRANULARITY = 100.0

def simpleaxis(ax):
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.get_xaxis().tick_bottom()
    ax.get_yaxis().tick_left()
    ax.minorticks_off()
def hexstr_to_hexint(hex_string):
    return int(hex_string, 16)
def plot_timewindow(args, total_name, total_list):
    color = ('black', 'red', 'green')
    lw = (1.5,1.5,3.5)
    ls = ((0,[1,1]), 'solid', 'solid')
    GRANULARITY = max(map(len, total_list))
    max_num = max(map(max, total_list))
    fig, ax = plt.subplots(1, figsize=(12,6))
    """
    for each_list in total_list:
        miss_index = GRANULARITY - len(each_list)
        for i in range(miss_index):
            each_list.append(1)
    for index in range(len(total_list)):
        access_list = total_list[index]
        plt.plot(range(1,int(GRANULARITY)+1), access_list, label = total_name[index], lw=lw[index],  color=color[index], ls=ls[index])
    
    max_expon = 0
    max_menMeans = max(map(max, total_list))
    while pow(10,max_expon)<max_menMeans:
        max_expon = max_expon + 1
    yind = []
    for key in range(max_expon+1):
       yind.append(pow(10,key)) 
    #yind = [1,10,100,1000,10000, 100000,1000000,10000000, 100000000]
    ax.set_yscale('log')    
    ax.set_yticks(yind)
    ax.set_yticklabels((r'$0$', r'$10^1$', r'$10^2$', r'$10^3$', r'$10^4$', r'$10^5$', r'$10^6$', r'$10^7$', r'$10^8$', r'$10^9$', r'$10^10$'), fontsize=24)
    ax.set_ylim((1,pow(10,max_expon-1)))
    ax.xaxis.set_tick_params(labelsize=20)

    ax.set_ylabel('Throughput MB/s', fontsize=24)
    ax.set_xlabel('Time (s)', fontsize=24)
    ax.set_xlim((0,GRANULARITY+5))
    simpleaxis(ax)
    plt.legend(fontsize=25, frameon=False, loc=4)
    plt.tight_layout()
    plt.savefig('{}_timewindow_log.pdf'.format(args.output))
    plt.close() 
    """
    
    for each_list in total_list:
        miss_index = GRANULARITY - len(each_list)
        for i in range(miss_index):
            each_list.append(-500)
    fig, ax = plt.subplots(1, figsize=(16,5))
    for index in range(len(total_list)):
        access_list = total_list[index]
        plt.plot(range(1,int(GRANULARITY)+1), access_list, label = total_name[index], lw=lw[index], color=color[index], ls=ls[index])
    ax.xaxis.set_tick_params(labelsize=20)
    ax.yaxis.set_tick_params(labelsize=20)
    #ax.set_ylim(0,1400)
    ax.set_ylim(0,4)
    ax.set_ylabel('Throughput GB/s', fontsize=24)
    ax.set_xlabel('Time (s)', fontsize=24)
    #ax.set_xlim((0,GRANULARITY+5))
    ax.set_xlim((0,300))
    simpleaxis(ax)
    plt.legend(fontsize=25, frameon=False)
    plt.tight_layout()
    plt.savefig('{}_timewindow.pdf'.format(args.output))
    plt.close() 

def combine_list(args, input_file_list):
    readfile = []
    readfile_total = []
    readfile_original = []
    for each_file in input_file_list:
        fp = open(each_file)
        i = 0
        for line in fp:
            i=i+1
            if i <= 2:
                continue
            readfile.append(map(int,line.rstrip().split(',')))
    max_len = max(map(len, readfile))
    for i in range(max_len):
        tmp_sum = 0
        for each_list in readfile:
            try:
                tmp_sum = tmp_sum + each_list[i]
            except:
                #print "warning: handling exception {}".format(i)
                continue
        readfile_total.append(tmp_sum/(1024*1024*1024.0))
        readfile_original.append(tmp_sum)
    if args.time_len:
        try:
            readfile_total = readfile_total[:int(args.time_len)]
            readfile_original = readfile_original[:int(args.time_len)]
        except:
            print len(readfile_total), len(readfile_original), args.time_len
    return readfile_total, readfile_original
    
def analysis_pin(args):
    GLOBAL = False
    w_counter=0
    r_counter=0
    total_list = []
    total_name = []
    total_original = []
    if not args.readfile1 or not args.title1:
    	print "enter read file path and title(at least readfile1)"
        exit()
    print "start reading.."
    for target,title in zip((args.readfile1, args.readfile2, args.readfile3), (args.title1, args.title2, args.title3)):
        if target:
            if not title:    
                print "enter read title for each readfile"
            print "read {}".format(target)
            readfile = []
            linefilep = open(target, 'r')
            for line in linefilep:
                readfile.append(line.strip())
            tmp_a, tmp_b = combine_list(args, readfile)
            total_list.append(tmp_a)
            total_name.append(title)
            total_original.append(tmp_b)
    if args.output:
        plot_timewindow(args, total_name, total_list)
        fp = open('{}_timewindow.txt'.format(args.output), 'w')
        for index in range(len(total_original)):
            fp.write("trace {} (unit: bytes):\n".format(total_name[index]))
            fp.write(",".join(map(str, total_original[index])))
            fp.write("\n")
        fp.close() 

def main():
    parser = argparse.ArgumentParser(description="CSV-Plot",formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('--readfile1', default=False, metavar='X',type=str, help='input file 1 (required)')
    parser.add_argument('--readfile2', default=False, metavar='X',type=str, help='input file 2')
    parser.add_argument('--readfile3', default=False, metavar='X',type=str, help='input file 3')
    parser.add_argument('--title1', default=False, metavar='X', type=str, help='title 1 (required)')
    parser.add_argument('--title2', default=False, metavar='X', type=str, help='title 2 (required)')
    parser.add_argument('--title3', default=False, metavar='X', type=str, help='title 3 (required)')
    parser.add_argument('--output', default=False, metavar='X', type=str, help='output file')
    parser.add_argument('--time_base', default=False, metavar='X', type=float, help='time_base')
    parser.add_argument('--time_len', default=False, metavar='X', type=float, help='time_len')
    args = parser.parse_args()
    analysis_pin(args)    
        
if __name__ == '__main__':
    main()

