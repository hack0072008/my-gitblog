<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-12-27
title: linux扩swap
tags: linux,swap
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: linux
status: publish
summary: linux扩swap
-->


### linux扩充swap
    linux扩充swap 1GB

#### 查看当前swap：
```shell
free -m
```


#### 增加swap:
```shell
    dd if=/dev/zero of=/swapfile bs=1M count=1024
    mkswap /swapfile
    swapon /swapfile
```

#### 自动挂载：
```shell
cat /etc/fstab
/swapfile                                 swap                    swap    defaults        0 0
```

#### 查看扩充后：
```shell
free -m
```



~~完~~
