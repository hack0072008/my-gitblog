<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-12-06
title: aliyun的centos下的iptables防探测
tags: aliyun,centos,iptables,防探测
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: linux
status: publish
summary: centos的iptabels防探测
-->




#### 参考：
     https://blog.csdn.net/orange596/article/details/78668808

#### 停止和关闭firewalld
     systemctl stop firewalld.service
     systemctl disable firewalld.service

#### 安装iptables:
     yum install iptables-services

#### 配置iptables:
     vim /etc/sysconfig/iptables:
     # sample configuration for iptables service
     # you can edit this manually or use system-config-firewall
     # please do not ask us to add additional ports/services to this default configuration
     *filter
     :INPUT DROP [0:0]
     :FORWARD ACCEPT [0:0]
     :OUTPUT ACCEPT [0:0]
     -A INPUT -p tcp --dport 80 -m string --algo bm --string "php" -j DROP
     -A INPUT -p tcp --dport 80 -m string --algo bm --string "java" -j DROP
     -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
     -A INPUT -p icmp -j ACCEPT
     -A INPUT -i lo -j ACCEPT
     -A INPUT -p tcp -m state --state NEW -m tcp --dport 22022 -j ACCEPT
     -A INPUT -p tcp -m state --state NEW -m tcp --dport 22500 -j ACCEPT
     -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
     -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
     -A INPUT -p tcp -m tcp --dport 5443 -j ACCEPT
     -A INPUT -j REJECT --reject-with icmp-host-prohibited
     -A FORWARD -j REJECT --reject-with icmp-host-prohibited
     COMMIT

#### 重启iptables:
     systemctl restart iptables.service
     systemctl enable iptables.service

#### 禁用selinux：
     vim /etc/selinux/config:
     SELINUX=disabled
     
     #立刻生效配置
     setenforce 0

