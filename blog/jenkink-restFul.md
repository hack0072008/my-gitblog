<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-12-04
title: jenkins的restFul Api
tags: python,jenkins
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: jenkins
status: publish
summary: python api操作jenkins
-->


#### 安装
    pip install python-jenkins
    
    doc参考：
        https://python-jenkins.readthedocs.io/en/latest/api.html

#### import
    >>> import jenkins

#### connect
    >>> jk = jenkins.Jenkins(url = 'http://platform.xxxx.xxxx.com:9090', username='root', password='********', timeout = 60)

#### get jenkins version
    >>> version = jk.get_version()

#### get job config.xml
    >>> admin_config = jk.get_job_config('admin-server')

#### modify job config.xml
    ...

#### modify job from config.xml
    >>> ret = jk.reconfig_job('admin-server', admin_config)

#### create job from config.xml
    >>> admin_2 = jk.create_job('admin-server-copy', admin_config)

#### delete job
    >>> ret = jk.delete_job('admin-server-copy')

#### check job is exist
    >>> ret = jk.job_exists('admin-server-copy')
    >>> print ret
    None
    >>> ret = jk.job_exists('admin-server')
    >>> ret
    True

#### get next build number
    >>> next_build_number = jk.get_job_info('admin-server')['nextBuildNumber']

#### build job
    >>> output = server.build_job('admin-server')

#### get job build info
    >>> from time import sleep; sleep(10)
    >>> build_info = jk.get_build_info('admin-server', next_build_number)
    >>> print(build_info)

#### get job build console info
    >>> build_info = jk.get_build_console_output('admin-server', 105)

~~待续~~






