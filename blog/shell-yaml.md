<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-11-30
title: shell-yaml的使用
tags: shell,yaml
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: shell
status: publish
summary: shell解析yaml
-->


#### shyaml：
     安装：
         pip install shyaml
     参考：
         https://github.com/0k/shyaml.git

#### example:
     ------------------------------分割线------------------------------
     [root@10 src]# cat buildspec.yml 
     version: 0.1
     phases:
       install:
         commands:
           - echo "Nothing to do in the install phase..."
       pre_build:
         commands:
           - echo "Make begin with [`date`], ok. "
           - yum -y install zlib-devel
       build:
         commands:
           - echo "Build begin with [`date`]"
           - sh build-cproject.sh
           - mvn install
       post_build:
         commands:
           - echo "Build complete with [`date`]"
     artifacts:
       files:
         - source: src/java/distribution.zip
           destination: content/
           action: unzip
     ------------------------------分割线------------------------------
      [root@10 src]# cat buildspec.yml |shyaml get-value version
      0.1[root@10 src]#
     
      [root@10 src]# cat buildspec.yml |shyaml get-value phases.install
      commands:
      - echo "Nothing to do in the install phase..."
     
      [root@10 src]# cat buildspec.yml |shyaml get-value phases.install.commands
      - echo "Nothing to do in the install phase..."
      
      cat buildspec.yml |shyaml get-type phases.build.commands
      sequence
      
      [root@10 src]# cat buildspec.yml |shyaml get-type phases.build
      struct

      cat buildspec.yml |shyaml get-length phases.build.commands
      3
      [root@10 src]# cat buildspec.yml |shyaml get-value phases.build.commands
      - echo "Build begin with [`date`]"
      - sh build-cproject.sh
      - mvn install
      
      [root@10 src]# cat buildspec.yml |shyaml get-value phases.build.commands.-1
      mvn install[root@10 src]# 
      
      [root@10 src]# cat buildspec.yml |shyaml get-value phases.build.commands.2
      mvn install[root@10 src]#


      [root@10 src]# cat buildspec.yml |shyaml get-value artifacts.files
      - source: src/java/distribution.zip
        destination: content/
        action: unzip

      cat buildspec.yml |shyaml get-value artifacts.files.0.destination
      content/[root@10 src]#
  
  
  
  
           

