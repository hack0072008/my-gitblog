<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-12-21
title: python-常见定时器
tags: python
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: python
status: publish
summary: python
-->



### python中常用的几种定时器
     参考：https://lz5z.com/Python%E5%AE%9A%E6%97%B6%E4%BB%BB%E5%8A%A1%E7%9A%84%E5%AE%9E%E7%8E%B0%E6%96%B9%E5%BC%8F/
     
#### 循环 sleep



#### threading模块中的Timer


#### 使用sched模块


#### APScheduler定时框架
    ```shell
    pip install apscheduler
    ```

     "`python
    from apscheduler.schedulers.blocking import BlockingScheduler
    from datetime import datetime
    # 输出时间
    def job():
        print(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    # BlockingScheduler
    scheduler = BlockingScheduler()
    scheduler.add_job(job, 'cron', day_of_week='1-5', hour=6, minute=30)
    scheduler.start()
    `"





~~完~~
