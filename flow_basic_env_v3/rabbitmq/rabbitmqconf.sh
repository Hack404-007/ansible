#!/bin/bash
# Author by: Tommy
# Date : 2017.08.18
# Version: 1.1.2
#

CurDir=$(dirname $0)
[ "$CurDir"  == '.' ] && CurDir=$(pwd)
vhostName='vh_flow'
ad_userName=`cat ${CurDir}/conf/password.ini | grep "admin_user" | awk -F ":" '{print $2}'`
ad_userPwd=`cat ${CurDir}/conf/password.ini | grep "admin_password" | awk -F ":" '{print $2}'`
app_userName=`cat ${CurDir}/conf/password.ini | grep "app_user" | awk -F ":" '{print $2}'`
app_userPwd=`cat ${CurDir}/conf/password.ini | grep "app_password" | awk -F ":" '{print $2}'`
mqnode_Name=$(/etc/init.d/rabbitmq-server  status | grep "Status of node" | awk '{print $4}' | sed -e "s/'//g")

rabbitmqctl  set_permissions -p / ${ad_userName} '.*' '.*' '.*'
curl -i -u ${ad_userName}:${ad_userPwd} -H "content-type:application/json" -XPUT http://localhost:15672/api/vhosts/${vhostName}

rabbitmqctl  set_permissions -p ${vhostName} ${ad_userName} '.*' '.*' '.*'
rabbitmqctl  set_permissions -p ${vhostName} ${app_userName} '.*' '.*' '.*'



for exchange in flow_channel_callabck_exchange ucpaas_flow_exchange flow_call_back_exchange flow_resend_channel_adapter_exchange; do
#创建exchange
	curl -i -u ${ad_userName}:${ad_userPwd} -H "content-type:application/json" -XPUT -d'{"type":"topic","auto_delete":false,"durable":true,"internal":false,"arguments":{}}' http://localhost:15672/api/exchanges/${vhostName}/${exchange}
done

for queue in flow_channel_callabck_queue ucpaas_flow_queue flow_call_back_queue flow_resend_channel_adapter_queue; do
#创建queue
	curl -i -u ${ad_userName}:${ad_userPwd} -H "content-type:application/json" -XPUT -d'{"auto_delete":false,"durable":true,"arguments":{},"node":"${mqnode_Name}"}' http://localhost:15672/api/queues/${vhostName}/${queue}
done


#api/bindings/vhost/e/exchange/q/queue
#创建绑定关系

for i in flow_channel_callabck_exchange ucpaas_flow_exchange flow_call_back_exchange flow_resend_channel_adapter_exchange; do
	pre_str=`echo $i | awk -F "exchange" '{print $1}'`
	curl -i -u ${ad_userName}:${ad_userPwd} -H "content-type:application/json" -XPOST -d'{"routing_key":"","arguments":{}}' http://localhost:15672/api/bindings/${vhostName}/e/${pre_str}exchange/q/${pre_str}queue
done
echo " "
echo -e "\e[1;32m !!!!!!NOTIFY!!!!!! \e[0m"
echo -e "\e[1;32m RabbitMq Exchange && Queur created while binding  has ok ...\e[0m"
echo " "
