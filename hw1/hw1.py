#!/usr/bin/python

import sys

range = len(sys.argv);
for i in xrange(1, range):
   file = open(sys.argv[i])
   info = file.read()
   sys.stdout.write(info)
   file.close()

