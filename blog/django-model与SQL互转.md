<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2019-01-31
title: django-model与SQL互转
tags: python,django
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: linux
status: publish
summary: django-model与SQL互转
-->


### django的model与SQL互相转换
    参考：
        https://www.jianshu.com/p/d2fae133d1d4


#### 安装依赖库
    - pip install django-pyodbc-azure pyodbc
    - 源码安装

#### 错误一：
    src/pyodbc.h:56:17: 致命错误：sql.h：没有那个文件或目录
    
    解决：
        yum install unixODBC unixODBC-devel
        再重装

#### 错误二：
    django.core.exceptions.ImproperlyConfigured: Error loading MySQLdb module: No module named MySQLdb.
    
    解决：
        pip install mysql-python

#### 错误三：
    sh: mysql_config: 未找到命令
    
    解决：
        yum install mysql-devel
        
#### 错误四：
    django.db.utils.OperationalError: (1045, "Access denied for user 'root'@'127.0.0.1' (using password: YES)")
    
    解决：
        开启mysql root用户密码登录，并检查`数据库用户名、密码、数据库库名配置`信息

#### 配置django databases
```shell
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'db_name',
        'USER': 'user',
        'PASSWORD': 'pass',
        'HOST': '127.0.0.1',
        'PORT': '3306'
    }
}
```

#### SQL转model
```shell
python manage.py inspectdb > ./app_name/models.py
```

#### model转SQL
    - django1.9不支持，只能用django命令 创建数据库更改`python manage.py makemigrations`、应用数据库`python manage.py migrate`，再用工具导出SQL
    - 老版本django可以用 `python manage.py sqlall app_name`命令把model转sql
    


~~完~~
