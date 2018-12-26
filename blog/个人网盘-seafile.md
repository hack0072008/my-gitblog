<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-12-26
title: 个人网盘-seafile的搭建与使用
tags: seafile,3b+,树莓派,linux
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: 3b+ 树莓派 linux
status: publish
summary: 个人网盘-seafile的搭建与使用
-->

### seafile个人云盘
    - 社区版免费，开源
    - 基于python，全平台(win, linux, ios, android)
    - 提供控制台，并有组管理和分享功能
    - 专业版可以与aws s3, ceph等接入
    - 专业版提供病毒扫描和安全审查功能


####  下载：
    download:
        https://www.seafile.com/download/
    
    example:
        wget https://download.seadrive.org/seafile-server_6.3.4_x86-64.tar.gz

#### 参考文档：
    https://manual-cn.seafile.com/deploy/using_sqlite.html
    
#### 解压
    cd /opt/apps/mycloud
    
    # tree . -L 2
    .
    ├── installed
    │   └── seafile-server_1.4.0_x86-64.tar.gz
    └── seafile-server-1.4.0
        ├── reset-admin.sh
        ├── runtime
        ├── seafile
        ├── seafile.sh
        ├── seahub
        ├── seahub.sh
        ├── setup-seafile.sh
        └── upgrade
    
#### 环境准备：
    pip install --upgrade setuptools   （pip install pillow moviepy 要不会报错）
    
    # on CentOS 7
    yum -y install epel-release
    rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
    yum -y install python-imaging MySQL-python python-memcached python-ldap python-urllib3 ffmpeg ffmpeg-devel
    pip install pillow moviepy(比较慢，需要多试几次)

#### 安装与配置：
    ./setup-seafile.sh
    server name:        zhangyh
    server ip/domain:   10.100.102.206
    seafile data dir:   /opt/apps/mycloud/seafile-data
    fileserver port:    8088
    port of seafile fileserver:   8088
    port of seahub:               8000
    
#### 启动与停止：
    run seafile server:     ./seafile.sh { start | stop | restart }
    run seahub  server:     ./seahub.sh  { start <port> | stop | restart <port> }
    
    登陆：
    http://10.100.102.206:8000/    email/password
    
    ios客户端: seafile-pro
    
#### 使用：
    - 图像能在线查看，太大的无法显示
    - 视频能在线播放
    - .doc在pc web上无法查看，在ios cli上可以查看
    - 其他类型文件未测试
    - 局域网上传与下载速度很快
    - 社区版支持目录上传，很方便
    - 支持组管理、私有资料库管理很方便
    - 支持自定义网盘名称、logo、背景、公司机构等
    - 支持https

#### 问题排查：
    https://github.com/haiwen/seafile/wiki




~~完~~




