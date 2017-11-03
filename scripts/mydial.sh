#!/bin/bash

host1="baidu.com"
host2="qq.com"

ppp_dial="my3gnet"

pppd call $ppp_dial &
sleep 12

./ppp_route_init.sh
while true
do 
	ping -s 1 -c 5 $host1    #¦…去PING第一个DNS
	if [ "$?" != "0" ]      #€¦…假如PING不通
	then
		ping -s 1 -c 2 $host2    #…去PING第二个DNS
		if [ "$?" != "0" ]      #¦…假如PING不通
		then   
			killall pppd        #¦…结束PPPD进程
			pppd call $ppp_dial &   #…再去拨号
			sleep 12            #€¦…等2s
		else
			sleep 5           ’ 
		fi 
	else
		sleep 120        
	fi               
done
