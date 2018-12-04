<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-11-30
title: 树莓派3b+_gitblog
tags: gitblog,3b+
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: 3b+
status: publish
summary: gitblog 树莓派3b+安装
-->

#### 软硬件配置：
    硬件：树莓派3B+
    系统：2018-11-13-raspbian-stretch.zip（1.0G）
    gitblog:https://github.com/jockchou/gitblog
            https://github.com/jockchou/gitblog/releases
    
#### 软件安装
    apt-get install php
    Failed to start The Apache HTTP Server.(与nginx默认端口80冲突，后续修改)
    
    apt-get install php-mysql
    apt-get install php-fpm
    apt-get install php-mbstring
    注意：不要参考网络教程安装什么php5,会报错，换源也没用，原因是新系统里的源里只有php7,没有php5
    
#### 软件配置
    vim /etc/apache2/ports.conf
    Listen 8080
    Listen 1443
    /etc/init.d/apache2 restart

#### 安装部署
    root@pi:/var/www# mkdir -p blog
    root@pi:/var/www# cd blog
    
    root@pi:/var/www# wget https://github.com/jockchou/gitblog/archive/v2.3.2.tar.gz
    root@pi:/var/www# tar zxvf v2.3.2.tar.gz
    root@pi:/var/www/blog# ll
    total 2892
    -rw-r--r-- 1 root root 2957011 Nov 30 13:50 v2.3.2.tar.gz
    drwxrwxr-x 6 root root    4096 Nov 30 14:50 gitblog-2.3.2
    
    root@pi:/var/www/blog# cd gitblog-2.3.2/
    root@pi:/var/www/blog/gitblog-2.3.2# ll
    total 836
    drwxrwxr-x  7 root root   4096 Apr 12  2017 sys
    -rw-rw-r--  1 root root 775989 Apr 12  2017 screenshot.png
    -rw-rw-r--  1 root root     74 Apr 12  2017 robots.txt
    -rw-rw-r--  1 root root   4301 Apr 12  2017 README.md
    -rw-rw-r--  1 root root   1936 Apr 12  2017 logo.png
    -rw-rw-r--  1 root root  11358 Apr 12  2017 LICENSE
    -rw-rw-r--  1 root root   9793 Apr 12  2017 index.php
    -rw-rw-r--  1 root root   1099 Apr 12  2017 history.txt
    -rw-rw-r--  1 root root   4286 Apr 12  2017 favicon.ico
    -rw-rw-r--  1 root root   2144 Apr 12  2017 example-conf.yaml
    drwxrwxr-x 14 root root   4096 Apr 12  2017 app
    drwxrwxr-x  8 root root   4096 Nov 30 14:23 theme
    drwxrwxr-x  3 root root   4096 Nov 30 14:24 blog
    -rw-rw-r--  1 root root    648 Nov 30 14:50 conf.yaml

    root@pi:/var/www# ll
    total 12
    drwxr-xr-x 2 root root 4096 Nov 30 12:26 html
    -rw-r--r-- 1 root root   19 Nov 30 13:47 index.php
    drwxr-xr-x 3 root root 4096 Nov 30 13:51 blog
    root@pi:/var/www# cat index.php 
    <?php phpinfo();?>

#### 502错误（root为运行用户,参考官方）
    cd /var/www/blog/gitblog-2.3.2
    chown -R root:root ./app/cache
    chown -R root:root ./app/logs
    
#### 其他配置
    vim /etc/php/7.0/apache2/php.ini
    short_open_tag = On

#### 重启服务
    /etc/init.d/apache2 restart
    /etc/init.d/nginx restart




