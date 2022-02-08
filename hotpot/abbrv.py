#! /usr/bin/python
import math;
import sys;
import string;
import os;
import re;

def mycmp(a, b):
	if (cmp(a[0], b[0]) == 0):
		return cmp(b[1], a[1]);
	else:
		return cmp(b[0], a[0]);

def pattern_match(str):
	confs = ["ISCA", "CASES", "FPGA", "DAC", "ISSS", "HICSS", "FPL", "CF", "SC", "FCCM", "IEDM", "IPDPS", "PLDI", "PACT", "ICCD"]; 
	ret = str;
	for x in confs:
		if (string.find(str, x + " '") != -1 and
		    string.find(str, "booktitle") != -1):
			re_pattern = re.compile(x + " '\d+");
			analyzed = re_pattern.findall(str);
			index = len(x) + 2;
			num = string.atoi(analyzed[0][index:index+2]);
			if (num > 50):
				num = 1900 + num;
			else:
				num = 2000 + num;
			#ret = "booktitle = \"{%s %d}\"," % (x, num);
			ret = "booktitle = \"{%s}\"," % (x);
			print ret;
# special case : MICRO
	if (string.find(str, "MICRO") != -1 and 
	      string.find(str, "booktitle") != -1):
		re_isca = re.compile('MICRO \d+');
		analyzed = re_isca.findall(str);
		num = string.atoi(analyzed[0][6:8]);
		num = 1967 + num;
		ret = "booktitle = \"{MICRO}\",";
		print ret;


	return ret;


def process(file_in, file_out):
	input = open(file_in);
	text = input.read();
	input.close();

	output = open(file_out, 'w');

	lines = string.split(text, '\n');
	for x in range(0, len(lines)):
		output.write(pattern_match(lines[x]) + "\n");
	output.close();

#print len(sys.argv);

if (len(sys.argv) != 3) :
	print "usage: abbrv.py <in> <out>\n";
	sys.exit(-1);

print sys.argv[1], "->", sys.argv[2];
process(sys.argv[1], sys.argv[2]);

#process("paper.bib", "paper_abbrv.bib");
#process("spe.bib", "spe_abbrv.bib");


