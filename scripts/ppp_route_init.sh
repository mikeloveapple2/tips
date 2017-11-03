#!/bin/bash

ppp_iface="ppp0"
sub_iface="eth0"

route del default 

route add default dev $ppp_iface

ifconfig $sub_iface down

ifconfig $sub_iface hw ether 00:12:34:56:78:90

ifconfig $sub_iface up
