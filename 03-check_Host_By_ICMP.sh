#!/bin/bash
#通过ping监控某个主机，当丢包率大于20%时发出告警
IP=127.0.0.1
while true
do
   n=`ping $IP -c3 2>/dev/null|grep 'received'|awk -F 'received, |%' '{print $2}'`
   if [ -z "$n" ]
   then
     echo "there is someting wrong in the script! the n is $n"
     exit
   fi
   if [ $n -ge 20 ]
   then
     echo "the host &IP is down,the n is $n"
   else
     echo "check done,$IP is alive!"
   fi
sleep 5
done
