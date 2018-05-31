#!/bin/bash
#
int='\033[94m
 ____       _     _     _ _   __  __         ___           _        _ _
|  _ \ __ _| |__ | |__ (_) |_|  \/  | __ _  |_ _|_ __  ___| |_ __ _| | |
| |_) / _` | /_ \| /_ \| | __| |\/| |/ _` |  | || /_ \/ __| __/ _` | | |
|  _ < (_| | |_) | |_) | | |_| |  | | (_| |  | || | | \__ \ || (_| | | |
|_| \_\__,_|_.__/|_.__/|_|\__|_|  |_|\__, | |___|_| |_|___/\__\__,_|_|_|
                                        |_|
\033[0m'

echo -e "$int"

sleep 2

# Get current directory
CurDir=$(dirname $0)
[ "$CurDir"  == '.' ] && CurDir=$(pwd)
logFile_Dir=${CurDir}/logs
[ -d ${logFile_Dir} ] || mkdir -pv ${logFile_Dir}

ipAddress=$(hostname  -i  | awk '{print $NF}')
nodeName=node1
ad_userName=`cat ${CurDir}/conf/password.ini | grep "admin_user" | awk -F ":" '{print $2}'`
ad_userPwd=`cat ${CurDir}/conf/password.ini | grep "admin_password" | awk -F ":" '{print $2}'`
app_userName=`cat ${CurDir}/conf/password.ini | grep "app_user" | awk -F ":" '{print $2}'`
app_userPwd=`cat ${CurDir}/conf/password.ini | grep "app_password" | awk -F ":" '{print $2}'`

echo "${ipAddress} ${nodeName}" >> /etc/hosts

rpm -vih ${CurDir}/software/erlang-17.4-1.el6.x86_64.rpm >> ${logFile_Dir}/install.log
rpm -vih ${CurDir}/software/rabbitmq-server-3.6.1-1.noarch.rpm >> ${logFile_Dir}/install.log

if test $? -eq 0; then
	echo "RabbitMq has already succeed."
	cp ${CurDir}/conf/rabbitmq.config /etc/rabbitmq/
else
	echo "RabbitMq has Failed."
	exit 1
fi

# Setting management web && add user for administrtor
service rabbitmq-server start
sleep 3
# create user  for administrator http
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user ${ad_userName} ${ad_userPwd}
rabbitmqctl set_user_tags ${ad_userName} administrator
rabbitmqctl  set_permissions -p / ${ad_userName} '.*' '.*' '.*'
# create user add for application tcp
rabbitmqctl add_user ${app_userName} ${app_userPwd}

echo " "
echo -e "\e[1;32m !!!!!!NOTIFY!!!!!! \e[0m"
echo -e "\e[1;32m RabbitMq Service installed succeed.\e[0m"
echo " "

sleep 3

echo -e "\e[1;32m RabbitMq init configuration start ....\e[0m"
sh ./rabbitmqconf.sh

