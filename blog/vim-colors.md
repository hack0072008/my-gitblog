



### vim主题颜色设置

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
