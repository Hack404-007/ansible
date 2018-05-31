#!/bin/bash
# Author by: Tommy
# Date : 2017.08.15
# version: 1.1.2


int='\033[94m
             _                                    _
  __ _ _   _| |_ ___  _ __ ___   ___  _   _ _ __ | |_
 / _` | | | | __/ _ \| /_ ` _ \ / _ \| | | | /_ \| __|
| (_| | |_| | || (_) | | | | | | (_) | |_| | | | | |_
 \__,_|\__,_|\__\___/|_| |_| |_|\___/ \__,_|_| |_|\__|

\033[0m'

echo -e "$int"
echo -e "\e[1;32m ----------------------------------------------------- \e[0m"

CurDir=$(dirname $0)
[ "$CurDir"  == '.' ] && CurDir=$(pwd)

case "$1" in
	all)
	cd ${CurDir}/nginx && sh nginx.sh
	cd ${CurDir}/mysql && sh mysql.sh
	cd ${CurDir}/redis && sh redis.sh
	cd ${CurDir}/rabbitmq && sh rabbitmq.sh
	;;
	nginx)
	cd ${CurDir}/nginx && sh nginx.sh
	;;
	mysql)
	cd ${CurDir}/mysql && sh mysql.sh
	;;
	redis)
	cd ${CurDir}/redis && sh redis.sh
	;;
	rabbitmq)
	cd ${CurDir}/rabbitmq && sh rabbitmq.sh	
	;;
	*)
	echo " "
	echo -e "\e[1;32m !!!!!! TIPS !!!!!! \e[0m"
	echo -e "\e[1;32m Usage:${basename} $0 ( all|nginx|mysql|redis|rabbitmq )\e[0m"
	echo " "
	exit 1
esac
exit 1
