#!/bin/bash
#在本地和远程rsync上备份mysql数据库，库为merchant,要求本地保存一周的数据，远程保存一个月的数据。脚本加入cron,每天凌晨3点执行

date_local=`date +%w` #本地备份文件名用星期循环
date_remote=`date +%m` # 远程备份文件名用每月几号来循环
dir_local=/opt/shell/data_dir/06
dir_remote=172.26.51.51::mysqlbackup
PASSWD_MYSQL=XXX
exec 1>/var/log/mysqlbak.log  2>/var/log/mysqlbak.log #定义接下来所有命令的正确输出和错误输出都会写到/var/log/mysqlbak.log

echo "mysql backup begin at `date +"%F %T"`."
mysqldump -uroot -p$PASSWD_MYSQL --default-character-set=gbk merchant > $dir_local/$date_local.sql
rsync -az $dir_local/$date_local.sql  $dir_remote/$date_remote.sql
echo "mysql backup end at `date +"%F %T"`"


