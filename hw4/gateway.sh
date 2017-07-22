#!/bin/bash

defgate=`ip route show | grep 'default' | awk '{print $3}'`
device=`ip route show | grep 'default' | awk '{print $5}'`
netmask=`ifconfig $device | sed -rn '2s/ .*:(.*)$/\1/p'`

echo 'gateway: '$defgate' netmask: '$netmask' device: '$device
