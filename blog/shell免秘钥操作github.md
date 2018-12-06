<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-12-06
title: shell免秘钥操作github
tags: shell,github
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: github
status: publish
summary: shell免秘钥操作github
-->

#### 生成密钥对：
     ssh-keygen

#### 上传公钥到github:
     点击用户图标 -> settings -> SSH and GPG keys -> New SSH key -> 编辑 title,无要求， 编辑 ssh key，粘贴公钥  -> add  ssh key

#### ssh 操作 仓库：
     cd xxxx
     git clone git@github.com:username/test.git
     
     cd test
     ....
     modify files
     ....
     
     git config --global user.email "you@example.com"
     git config --global user.name "Your Name"
     
     git add .
     git commit -m "test"
     git push
     
     
     
     
----完----
     
