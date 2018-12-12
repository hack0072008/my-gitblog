<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-12-12
title: 个人网盘kiftd
tags: 网盘,kiftd
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: linux
status: publish
summary: 个人网盘kiftd
-->




#### 个人网盘kiftd
    完全开源个人网盘 kiftd

#### Note
     个人网盘kiftd（jdk + jar）
     官网：https://github.com/KOHGYLW/kiftd
     文档：https://kohgylw.gitee.io/QuickStart.html
     
#### 下载
     wget https://github.com/KOHGYLW/kiftd/archive/master.zip
     
#### 安装
     cd /opt/apps/
     unzip kiftd-master.zip
     
#### 配置java环境（略）
     java -version
     java version "1.8.0_91"
     Java(TM) SE Runtime Environment (build 1.8.0_91-b14)
     Java HotSpot(TM) 64-Bit Server VM (build 25.91-b14, mixed mode)
     
#### 配置端口
     1.配置iptables
     2.配置云服务器安全组
     
####  启动
     cd /opt/apps/kiftd
     java -jar kiftd-1.0.9-RELEASE.jar -console    (命令行模式)
     java -jar kiftd-1.0.9-RELEASE.jar             (界面模式)

#### 命令行模式命令
     -start 启动服务器
     -stop 停止服务器
     -exit 停止服务器并退出应用
     -restart 重启服务器
     -status 查看服务器状态
     
#### 杂项
     a.默认用户密码：admin/000000
     b.账号配置文件和服务器配置文件都在 /opt/apps/kiftd/conf/下,第一次启动后才生成配置文件，默认是空
     c.除了可以上传、下载、删除、创建目录外，可以在线查看图片、播放mp3文件、播放mp4视频、在线查看pdf等,doc/ppt/xls等无法在线编辑和查看
     d.可以在配置文件中设置强制登陆，创建其他用户和组，以及设置其他用户和组的权限(参考解压包后的：kiftd说明文档.pdf)
     e.目录结构：
         ├── conf                                                  #配置目录
         │   ├── account.properties                                #账户配置
         │   └── server.properties                                 #服务器配置
         ├── filesystem                                            #文件存储目录
         │   ├── fileblocks
         │   │   └── file_96e1f49315c547c285212025512cab1b.block
         │   ├── filenodes
         │   │   └── kift.mv.db
         │   └── temporaryfiles
         ├── kiftd-1.0.9-RELEASE.jar                               #服务jar包
         ├── kiftd说明文档.pdf
         ├── logs                                                  #日志目录
         │   └── 2018_12_11.klog
         ├── mybatisResource
         │   ├── mapperXML
         │   │   ├── FolderMapper.xml
         │   │   └── NodeMapper.xml
         │   └── mybatis.xml
         ├── README.md
         ├── webContext
         └───使用许可




     
     

