<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-12-17
title: 树莓派3b+_AlphaBot2模块列表
tags: alphaBot2,3b+
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: 3b+
status: publish
summary: 树莓派3b+使用AlphaBot2各模块
-->





### Arduino控制程序：
     Run-Test                       电机测试
     Joystick 程序                  五向摇杆
     IR 程序                        红外遥控器控制
     Infrared-Obstacle-Avoidancec   红外避障
     Ultrasionc-Obstacle-Avoidance  超声波避障
     Ultrasionc-Infrared-Obstacle-Avoidance  超声波红外避障
     Ultrasionc_Ranging             超声波测距
     TRSensors                      寻迹传感器测试
     Infrared-Line-Tracking         红外寻迹
     W2812                          RGB彩灯
     OLED                           绘图操作demo
     Line-Tracking                  综合程序
     MazeSolver                     迷宫程序
     Bluetooth                      蓝牙控制
     Bluetooth-json                 蓝牙控制(json格式)

----

### 树莓派控制程序(AlphaBot2.tar.gz):
     wget http://www.waveshare.net/w/upload/e/ee/AlphaBot2-Demo.7z
     wget http://www.waveshare.net/w/upload/c/c3/Rpi_ws281x-master.zip
     
#### gpio
     git clone git://git.drogon.net/wiringPi
     cd wiringPi
     ./build
     gpio -v
     gpio readall
#### 红外遥控器控制
     cd ~/AlphaBot2/python
     python IRremote.py
#### 电机测试
     cd ~/AlphaBot2/python
     python AlphaBot2.py
#### 五向摇杆
     cd ~/AlphaBot2/python
     python Joystick.py
#### 红外避障
     cd ~/AlphaBot2/python
     python Infrared_Obstacle_Avoidance.py
#### 超声波测距（树莓派 3B 套餐不包含超声波模块）
     cd ~/AlphaBot2/python
     python Ultrasonic_Rangeing.py
#### 超声波测距（树莓派 3B 套餐不包含超声波模块）
     cd ~/AlphaBot2/python
     python Infrared_Obstacle_Avoidance.py
#### RGB 彩灯
     rpi_ws281x-master.zip
     unzip rpi_ws281x-master.zip
     
     apt-get install build-essential python-dev scons swig
     
     cd rpi_ws281x-master
     scons
     
     ./test
     
     cd python
     python setup.py install
     
     cd examples
     python lowlevel.py
     
     cd ~/AlphaBot2/python
     python ws2812.py
#### 循迹传感器测试
     cd ~/AlphaBot2/python
     python TRSensors.py
#### 红外循迹程序
     cd ~/AlphaBot2/python
     python LineFollow.py
#### 舵机
     cd ~/AlphaBot2/python
     python PCA9685.py
#### mjpg-streamer 软件实时监控
     a,raspi-config 开启摄像头
     b,/etc/modules 添加一行:bcm2835-v4l2
     c,重启后,ls -ltr /dev/video0
     (若无,rpi-update)
     
     cd AlphaBot2/lib/mjpg-streamer
     ./start
     http://ip:8080/
#### 通过 webiopi 实现远程遥控
     cd AlphaBot2/lib/WebIOPi-0.7.1-raspi2
     ./setup.sh
     webiopi -h
     webiopi -d -c /etc/webiopi/config
     http://ip:8000
     
     mjpg-AlphaBot 目录，修改视频源 IP:
     cd ./AlphaBot2/mjpg-AlphaBot/
     vim index.html
     http://x.x.x.x:8080/?action=stream
     
     cd ./AlphaBot2/mjpg-AlphaBot
     webiopi -c config
     http://x.x.x.x:8000/
     
     ./AlphaBot2/mjpg-AlphaBot/mjpg-AlphaBot
     webiopi -c config
     
     设置开机启动：
     cd ./AlphaBot2/mjpg-AlphaBot
     cp config /etc/webiopi/config
     update-rc.d webiopi defaults
     vim /etc/rc.local:
         cd /home/pi/AlphaBot2/lib/mjpg-streamer
         ./start.sh &
#### 通过 Bottle 实现远程遥控
     a.apt-get install python-bottle
     b.cd ~/AlphaBot2/Web-RGB
       python main
     c. http://ip:8000
       (手机端)
     d.cd ~/AlphaBot2/Web-Control
       vim index.html,修改真实ip:
       <img width="320" height="240" src="http://192.168.10.235:8080/?action=stream">
     e.python main
     f.http://ip:8000
     g.开机启动：
       vim /etc/rc.local:
         cd /home/pi/AlphaBot2/lib/mjpg-streamer
         ./start.sh &
         cd /home/pi/AlphaBot2/Web-Contrl
         python main &
     h.vim /etc/dhcpcd.comf 设置静态 IP
         interface wlan0
         static ip_address = 192.168.1.114/24
         static routers = 192.168.1.1
#### 通过软件远程遥控小车
     a.cd ~/AlphaBot2/App-Control
     b.vim main.py:
       Host = '192.168.10.235'
     c.python main
     
     d.运行mjpg-streamer
     
     e.打开 AlphaBot.exe 程序，输入 IP 地址，mjpg-stream 的端口号，小车 Soket 服务端的端口号
     f.开机启动, vim /etc/rc.local:
       cd /home/pi/AlphaBot/lib/mjpg-streamer
       ./start.sh &
       cd /home/pi/AlphaBot/App-Contrl
       python main &
     g.可开启树莓派无线网络适配器的AP功能(不用连接WIFI)
     
#### 通过树莓派蓝牙遥控小车
     a.升级蓝牙软件包
       apt-get update
       apt-get upgrade -y
       apt-get dist-upgrade -y
       apt-get install pi-bluetooth bluez bluez-firmware blueman
     b.pi用户到蓝牙组 
       usermod –G Bluetooth –a pi
     c.reboot
     d.启动/增加 SPP，开启蓝牙设备:
       vim /etc/systemd/system/dbus-org.bluez.service
         ExecStart=/usr/lib/bluetooth/bluetoothd
         ExecStartPost=/usr/bin/sdptool add SP
       reboot
     e.hciconfig
       (如果/boot/config.txt 文件中有 dtoverlay=pi3-miniuart-bt 这语句需要注释掉)
     f.bluetoothctl
       agent on
       agent on
       default-agent
       pair XX:XX:XX:XX:XX:XX ( XX:XX:XX:XX:XX:XX 替换为你自己设备的地址)
       trust XX:XX:XX:XX:XX:XX (配对之后把设备添加到信任列表)
       connect XX:XX:XX:XX:XX:XX
       (注意：如果命令行下链接不成功可以在图形界面下连接。)
     g.cd /AlphaBot2/Bluetooth-Control
       rfcomm watch hci0 1 python bluetooth.py
     h.下载APP(只有安卓, page 45)
       https://fir.im/hysk
     i.bluetoothctl
       discoverable on
       quit
      
      
      
      
