#!/bin/bash
#批量修改指定文件下的某一类型的文件的文件名
find /opt/shell/data_dir/04 -type f -name "*.txt" >/opt/shell/data_dir/04/txt.list
for f in `cat /opt/shell/data_dir/04/txt.list`
do
    mv $f $f.bak
done
