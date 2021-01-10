#!/bin/bash
#以日期格式xxxx-xx-xx为文件名，每日记录磁盘使用情况
d=`date +%F`
filename=$d.log
df -h  &>/opt/shell/data_dir/01/$filename 
