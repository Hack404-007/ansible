#!/bin/bash
#

int='\033[94m

 ____          _ _       ___           _        _ _
|  _ \ ___  __| (_)___  |_ _|_ __  ___| |_ __ _| | |
| |_) / _ \/ _` | / __|  | || /_ \/ __| __/ _` | | |
|  _ <  __/ (_| | \__ \  | || | | \__ \ || (_| | | |
|_| \_\___|\__,_|_|___/ |___|_| |_|___/\__\__,_|_|_|

\033[0m'

echo -e "$int"
sleep 2

CurDir=$(dirname $0)
[ "$CurDir"  == '.' ] && CurDir=$(pwd)

redisItem='redis_flow'
redisDir='/usr/local/redis'
redisPwd=`cat ${CurDir}/conf/password.ini`
logFile_Dir=${CurDir}/logs

[ -d ${logFile_Dir} ] || mkdir -pv ${logFile_Dir}
[ -d ${redisDir} ] || mkdir -pv ${redisDir}

if ! cat /etc/passwd | grep "redis" > /dev/null; then
	useradd  redis >> ${logFile_Dir}/install.log
fi	

yum install -y zlib zlib-devel openssl openssl-devel pcre pcre-devel gcc make  gcc-c++ glibc.i686 >> ${logFile_Dir}/install.log


tar zxvf ${CurDir}/software/redis-3.2.8.tar.gz -C ${redisDir}
mv ${redisDir}/redis ${redisDir}/${redisItem}
chown redis:redis -R ${redisDir}
cp ${CurDir}/conf/redis.conf ${redisDir}/${redisItem}/conf/
echo "requirepass ${redisPwd}" >> ${redisDir}/${redisItem}/conf/redis.conf

su redis -c  "${redisDir}/${redisItem}/bin/redis-server ${redisDir}/${redisItem}/conf/redis.conf" >> ${logFile_Dir}/install.log
echo "su redis -c '${redisDir}/${redisItem}/bin/redis-server ${redisDir}/${redisItem}/conf/redis.conf' " >> /etc/rc.local
echo " "
echo -e "\e[1;32m !!!!!!NOTIFY!!!!!! \e[0m"
echo -e "\e[1;32m Redis Service installed succeed.\e[0m"
echo " "

