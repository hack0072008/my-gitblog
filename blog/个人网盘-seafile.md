

### seafile个人云盘
    - 社区版免费，开源
    - 基于python，全平台(win, linux, ios, android)
    - 提供控制台，并有组管理和分享功能
    - 专业版可以与aws s3, ceph等接入
    - 专业版提供病毒扫描和安全审查功能


####  下载：
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

#### 问题排查：
    https://github.com/haiwen/seafile/wiki




~~完~~




