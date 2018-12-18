<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-12-17
title: 树莓派3b+_wifi-ap
tags: wifi-ap,3b+
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: 3b+ wifi-ap
status: publish
summary: 树莓派3b+使用AP模式
-->




### 树莓派设置wifi ap模式：
    参考：
        https://www.cnblogs.com/visionsl/p/8042315.html
    
    或者
    
    git clone https://github.com/oblique/create_ap.git
    cd create_ap/
    make install
    apt-get install util-linux procps hostapd iproute2 iw haveged dnsmasq -y
    
    
    ifdown wlan0
    create_ap wlan0 eth0  | create_ap --no-virt wlan0 eth0 | create_ap --no-virt wlan0 eth0 ssidname password
    
    
    
    
    ~~完~~
