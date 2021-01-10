#!/bin/bash
#计算linux机器所有进程占用内存的大小
SUM=0
for mem in `ps aux|awk '{print $6}'|grep -v "RSS"`
do
    SUM=$[$SUM+$mem]
done
echo "the total memory that been used is $SUM."
