<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2019-01-09
title: python-多线程的使用
tags: python,threading
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: python threading
status: publish
summary: python-多线程的使用
-->




### 参考：
    https://www.cnblogs.com/tkqasn/p/5700281.html
    
    阻塞模式的使用：
    https://www.cnblogs.com/cnkai/p/7504980.html

### 多线程方法一
```python
import threading
import time

#方法一：将要执行的方法作为参数传给Thread的构造方法
def action(arg):
    time.sleep(1)
    print 'the arg is:%s\r' %arg

for i in xrange(4):
    t =threading.Thread(target=action,args=(i,))
    t.start()
```

### 多线程方法二
```python

#方法二：从Thread继承，并重写run()
class MyThread(threading.Thread):
    def __init__(self,arg):
        super(MyThread, self).__init__()#注意：一定要显式的调用父类的初始化函数。
        self.arg=arg
    def run(self):#定义每个线程要运行的函数
        time.sleep(1)
        print 'the arg is:%s\r' % self.arg

for i in xrange(4):
    t =MyThread(i)
    t.start()
```
### 多线程属性和方法
    构造方法： 
    Thread(group=None, target=None, name=None, args=(), kwargs={}) 
    
    　　group: 线程组，目前还没有实现，库引用中提示必须是None； 
    　　target: 要执行的方法； 
    　　name: 线程名； 
    　　args/kwargs: 要传入方法的参数。
    
    实例方法： 
    　　isAlive(): 返回线程是否在运行。正在运行指启动后、终止前。 
    　　get/setName(name): 获取/设置线程名。 
    
    　　start():  线程准备就绪，等待CPU调度
    　　is/setDaemon(bool): 获取/设置是后台线程（默认前台线程（False））。（在start之前设置）
    
    　　　　如果是后台线程，主线程执行过程中，后台线程也在进行，主线程执行完毕后，后台线程不论成功与否，主线程和后台线程均停止
           　　如果是前台线程，主线程执行过程中，前台线程也在进行，主线程执行完毕后，等待前台线程也执行完成后，程序停止
    　　start(): 启动线程。 
    　　join([timeout]): 阻塞当前上下文环境的线程，直到调用此方法的线程终止或到达指定的timeout（可选参数）。
  
    t.setDaemon(True)#设置线程为后台线程
    

### centos进程下线程信息查看：
    参考：
        https://www.cnblogs.com/EasonJim/p/8098217.html

    方法一：
```shell
ps -T -p 2446
```
    方法二：
```shell
top -H -p 2446
```
    方法三：
```shell
yum install -y htop
htop
```
