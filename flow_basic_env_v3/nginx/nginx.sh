#!/bin/bash
# Author by: Tommy
# Date: 2017.08.15
# version 1.1.1
int='\033[94m
 _   _       _              ___           _        _ _
| \ | | __ _(_)_ __ __  __ |_ _|_ __  ___| |_ __ _| | |
|  \| |/ _` | | /_ \\ \/ /  | || /_ \/ __| __/ _` | | |
| |\  | (_| | | | | |>  <   | || | | \__ \ || (_| | | |
|_| \_|\__, |_|_| |_/_/\_\ |___|_| |_|___/\__\__,_|_|_|
       |___/

\033[0m'

echo -e "$int"

sleep 2

# Install basic software
yum -y install gcc openssl-devel pcre-devel zlib-devel make

baseDir='/usr/local/nginx'

if [ -f ${baseDir}/sbin/nginx ]; then
	echo "Nginx had already installed"
	exit 1
fi

mkdir -p /usr/local/nginx/tmp/{client,proxy,fcgi}

if ! cat /etc/passwd | grep "nginx" > /dev/null; then
	useradd -u 602 nginx  -M -s /sbin/nologin
fi

#Get current directory
CurDir=$(dirname $0)
[ "$CurDir"  == '.' ] && CurDir=$(pwd)
logFile_Dir=${CurDir}/logs
[ -d ${logFile_Dir} ] || mkdir -pv ${logFile_Dir}

cd ${CurDir}/software
tar zxvf nginx-1.12.1.tar.gz
cd nginx-1.12.1 
./configure \
 --prefix=/usr/local/nginx \
 --user=nginx --group=nginx \
 --with-http_ssl_module \
 --with-http_gzip_static_module \
 --http-client-body-temp-path=/usr/local/nginx/tmp/client/ \
 --http-proxy-temp-path=/usr/local/nginx/tmp/proxy/ \
 --http-fastcgi-temp-path=/usr/local/nginx/tmp/fcgi/ \
 --with-poll_module \
 --with-file-aio \
 --with-http_realip_module \
 --with-http_addition_module \
 --with-http_random_index_module \
 --with-pcre \
 --with-http_stub_status_module \
 --with-stream

if test $? -eq 0; then
	make && make install >> ${logFile_Dir}/makeinstall.log
	chown -R nginx.nginx  ${baseDir}
        mv /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf_$(date +%F)
	cp ${CurDir}/conf/nginx.conf /usr/local/nginx/conf/nginx.conf
	cp ${CurDir}/conf/api-http.conf /usr/local/nginx/conf/api-http.conf
	cp ${CurDir}/conf/nginx /etc/init.d/nginx && chmod +x /etc/init.d/nginx
	cp ${CurDir}/conf/nginx_log_cut.sh /usr/local/nginx/sbin/nginx_log_cut.sh && chmod +x /usr/local/nginx/sbin/nginx_log_cut.sh
	echo "10 0 * * * sh /usr/local/nginx/sbin/nginx_log_cut.sh"  >>/var/spool/cron/root
else
	echo "Nginx  has Error in during configure."
	exit 1
fi
echo " "
echo -e "\e[1;32m !!!!!!NOTIFY!!!!!! \e[0m"
echo -e "\e[1;32m Nginx Service installed succeed.\e[0m"
echo " "
