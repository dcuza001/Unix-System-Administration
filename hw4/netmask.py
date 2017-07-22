#!/usr/bin/python

import sys
#from netaddr import ipaddress
import binascii
from socket import inet_ntoa
from struct import pack


#ip = IPAddress('255.255.255.255')
bits = int(sys.argv[1])
#print bits
addr = 32-bits
shift= addr
test = pow(2, addr) -1
addr = pow(2, (addr))
usable = addr-2
mask = 4294967295
netmask = mask << shift
m1 = test & 0xFF000000 < 24
m2 = test & 0x00FF0000 < 16
m3 = test & 0x0000FF00 < 8
m4 = test & 0x000000FF < 4

def calcNetmask(bits):
   b = 0xffffffff ^ (1 << 32-bits) - 1
   return inet_ntoa(pack('>I', b))

final = calcNetmask(bits)
print "SOMETING: "
print bits

def bin(a):
      s=''
      t={'0':'000','1':'001','2':'010','3':'011','4':'100','5':'101','6':'110','7':'111'}
      for c in oct(a)[1:]:
         s+=t[c]
      return s


#def bin2(s):
 #     return str(s) if (s<=1) else (bin2(s>>1) + str(s&1))

print bin(m1)
print bin(m2)
print bin(m3)
print bin(m4)


print "addresses: %s" % addr
print "usable: %s" % usable
print "netmask: %s" % test

print "binary: "
print bin(test)




#range = len(sys.argv);
#for i in xrange(1, range):
 #  file = open(sys.argv[i])
  # info = file.read()
  # sys.stdout.write(info)
  # file.close()

