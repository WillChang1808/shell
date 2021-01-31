#/bin/bash
#定时检查机器是否在监听80端口，如果没有重启httpd,并发出通知邮件
function check_80()
{
  MAIL=a@b.com
  if netstat -lntp | grep -q ':80'
  then
    exit
  fi
  echo '发送邮件告知port80 down'
  echo '进行重启操作'
  n=`pgrep -l httpd|wc -l`
  if [ $n -eq 0 ]
  then
    echo '启动httpd，如果启动错误将错误日志写入/tmp/apache_start.err'
  fi
  if [ -s /tmp/apache_start.err ]
  then
    echo '发送邮件告知httpd重启失败，并附带错误详情'
  fi
  #exit
}

while : ; do #每隔5s循环调用check函数
  check_80
  sleep 5
done


