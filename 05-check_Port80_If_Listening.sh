#/bin/bash
#定时检查机器是否在监听80端口，如果没有重启httpd,并发出通知邮件
check_80()
{
  MAIL=a@b.com
  if netstat -lntp | grep -q ':80'
  then
    exit
  fi
  python mail.py $MAIL "Check_80" "Port 80 is down."
  /usr/local/apache2/bin/apachectl restart &> /dev/null
  n=`pgrep -l httpd|wc-l`
  if[ $n -eq 0]
  then
    /usr/local/apache2/bin/apachectl start 2> /tmp/apache_start.err
  fi
  if[ -s /tmp/apache_start.err ]
  then
    python mail.py $MAIL "apache_start_error" "`cat /tmp/apache_start.err`"
  fi
}

while : ;do
  check_80()
  sleep 30
done


