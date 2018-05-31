#!/bin/bash
# Author by: Tommy
# Date: 2017.08.14
# Description: Install MySQL5.6 && init data
# version: 1.1.2


int='\033[94m

 __  __       ____   ___  _       ___           _        _ _
|  \/  |_   _/ ___| / _ \| |     |_ _|_ __  ___| |_ __ _| | |
| |\/| | | | \___ \| | | | |      | || |_ \/ __| __/ _` | | |
| |  | | |_| |___) | |_| | |___   | || | | \__ \ || (_| | | |
|_|  |_|\__, |____/ \__\_\_____| |___|_| |_|___/\__\__,_|_|_|
        |___/

\033[0m'

echo -e "$int"

echo " "
#Get current directory
CurDir=$(dirname $0)
[ "$CurDir"  == '.' ] && CurDir=$(pwd)
logFile_Dir=${CurDir}/logs
[ -d ${logFile_Dir} ] || mkdir -pv ${logFile_Dir}

#Define install variable
User=root
Pass=`cat ${CurDir}/conf/password.ini`
Host=localhost
mysql_Exec=/usr/local/mysql/bin/mysql

#Install basic software
yum -y install gcc gcc-c++ cmake  ncurses-devel bison -y
#Check MySQL is already installed
if [ -d "/usr/local/mysql" ]; then
	echo "MySQL is already installed."
	exit 1
fi


#Create user for MySQL
if ! cat /etc/passwd | grep mysql &> /dev/null; then
    groupadd -g 27 mysql
    useradd -u 27 -g mysql -M -s /sbin/nologin mysql
fi

#Get current directory
CurDir=$(dirname $0)
[ "$CurDir"  == '.' ] && CurDir=$(pwd)

MySQL_Install()
{
	cd ${CurDir}/software
	tar zxvf mysql-5.6.37.tar.gz
	cd mysql-5.6.37
	cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
	-DMYSQL_UNIX_ADDR=/tmp/mysql.sock \
	-DDEFAULT_CHARSET=utf8 \
	-DDEFAULT_COLLATION=utf8_general_ci \
	-DWITH_EXTRA_CHARSETS_STRING=all \
	-DWITH_MYISAM_STORAGE_ENGINE=1 \
	-DWITH_INNOBASE_STORAGE_ENGINE=1 \
	-DWITH_MEMORY_STORAGE_ENGINE=1 \-DWITH_READLINE=1 \
	-DENABLED_LOCAL_INFILE=1 \
	-DMYSQL_DATADIR=/usr/local/mysql/data \
	-DMYSQL_USER=mysql
	make && make install >> ${logFile_Dir}/makeinstall.log 2>&1
	if test $? -eq 0; then
		echo "MySQL is installed Succeed."
	else
		echo "MySQL is installed Failed."
	fi
	chown -R mysql.mysql /usr/local/mysql/
	cd /usr/local/mysql
	cp support-files/mysql.server /etc/init.d/mysqld && chmod +x /etc/init.d/mysqld
	cp ${CurDir}/conf/mysql.sh /etc/profile.d/mysql.sh && chmod +x /etc/profile.d/mysql.sh
	
	# configure MySQL basic information
	ln –sv /usr/local/mysql/include /usr/include/mysql
	echo ‘ /usr/local/mysql/lib’ > /etc/ld.so.conf.d/mysql.conf
	ldconfig –v > /dev/null 2>&1
	source /etc/profile.d/mysql.sh
	if [ ! -f /etc/my.cnf ]; then
		cp ${CurDir}/conf/my.cnf /etc/my.cnf
	else
		mv /etc/my.cnf /etc/my.cnf_$(date +%F)
		cp ${CurDir}/conf/my.cnf /etc/my.cnf
	fi

	/usr/local/mysql/scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data >> ${logFile_Dir}/mysql_install_db.log
	/etc/init.d/mysqld start
	if test $? -eq 0; then
		echo "MySQL starts succeed."
	else
		echo "MySQL starts Failed."
	fi
		
}


mysql_security()
{
	${mysql_Exec} -h${Host} -u${User}  -e "grant all privileges on *.* to root@'127.0.0.1' identified by '${Pass}' with grant option;"
    	${mysql_Exec} -h${Host} -u${User}  -e "grant all privileges on *.* to root@'localhost' identified by '${Pass}'with grant option;"
    	${mysql_Exec} -h${Host} -u${User} -p${Pass} -e "delete from mysql.user where Password='';"
    	${mysql_Exec} -h${Host} -u${User} -p${Pass} -e "delete from mysql.db where User='';"
    	${mysql_Exec} -h${Host} -u${User} -p${Pass} -e "drop database test;"
    	${mysql_Exec} -h${Host} -u${User} -p${Pass} -e "reset master;"
}


Initialize_mysqldata()
{
	# Create database for  flow_admin  flow_fmp  flow_portal_admin
	for db in flow_admin flow_fmp flow_portal_admin; do
		${mysql_Exec} -h${Host} -u${User} -p${Pass} -e "create database ${db};"
			if test $? -eq 0; then
				echo "${db} created is Succeed." >> ${logFile_Dir}/db.log
			else
				echo "${db} created is Failed." >> ${logFile_Dir}/db.log
			fi
	done
	# Import MySQL data
	for dbname in flow_admin flow_fmp flow_portal_admin; do
        	${mysql_Exec} -h${Host} -u${User} -p${Pass} -e "USE ${dbname} ; SOURCE ${CurDir}/data/${dbname}.sql;"
		if test $? -eq 0; then
			echo "${dbname} import succeed." >> ${logFile_Dir}/db.log
		else
			echo "${dbname} import Failed." >> ${logFile_Dir}/db.log
		fi
	done
	${mysql_Exec} -h${Host} -u${User} -p${Pass} -e "USE flow_admin; SOURCE ${CurDir}/data/area_code.sql;" >> ${logFile_Dir}/db.log
	${mysql_Exec} -h${Host} -u${User} -p${Pass} -e "USE flow_admin; SOURCE ${CurDir}/data/mobile_home_info.sql;" >> ${logFile_Dir}/db.log
	
}

# Define master function
main()
{
	MySQL_Install
	mysql_security
	Initialize_mysqldata
}

main
echo " "
echo -e "\e[1;32m !!!!!!NOTIFY!!!!!! \e[0m"
echo -e "\e[1;32m MySQL Service && Data is already Imported Succeed.\e[0m"
echo " "
