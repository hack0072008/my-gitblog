<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-12-18
title: 树莓派3b+_vim颜色主题
tags: vim,3b+
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: 3b+ vim
status: publish
summary: 树莓派3b+ 修改vim主题
-->



### vim主题颜色设置
    环境: 树莓派3b+ ubuntu vim8
          uname -a
          Linux pi 4.14.79-v7+ #1159 SMP Sun Nov 4 17:50:20 GMT 2018 armv7l GNU/Linux
          
          vim --version
          VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Sep 30 2017 18:21:38)
          Included patches: 1-197, 322, 377-378, 550, 703, 706-707
          Modified by pkg-vim-maintainers@lists.alioth.debian.org
          Compiled by pkg-vim-maintainers@lists.alioth.debian.org
          ...

#### 1.查看vim配置文件
    先查看是否有用户配置文件
        如果有：
            ls -ltr ~/.vimrc
        如果没有：
            ls -ltr /etc/vim/vimrc.local
            如果有：
                修改此文件
            如果没有：
                ls -ltr /etc/vim/vimrc
                这个肯定应该有，修改这个文件
#### 2.查看当前vim自带的颜色主题：
    ls -tlr /usr/share/vim/vim{XX}/colors/,例如：
    ls -ltr /usr/share/vim/vim80/colors/
    total 76
    -rw-r--r-- 1 root root 1840 Oct  1  2017 zellner.vim
    -rw-r--r-- 1 root root 1629 Oct  1  2017 torte.vim
    -rw-r--r-- 1 root root 2445 Oct  1  2017 slate.vim
    -rw-r--r-- 1 root root 2720 Oct  1  2017 shine.vim
    -rw-r--r-- 1 root root 1393 Oct  1  2017 ron.vim
    -rw-r--r-- 1 root root 2904 Oct  1  2017 README.txt
    ...
#### 3.修改对应步骤1中的配置文件
    vim xxx.vimrc:
    color delek    
    #在文件末尾加一行

#### 4.顺便开启语法高亮：
    syntax on



~~完~~
