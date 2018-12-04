<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-11-30
title: ec2挂载s3fs
tags: ec2,s3fs
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: ec2
status: publish
summary: EC2使用S3FS
-->

# 官网：
    https://github.com/s3fs-fuse/s3fs-fuse


# 0.IAM key,id
    echo ACCESS_KEY_ID:SECRET_ACCESS_KEY > ~/.passwd-s3fs
    chmod 600 ~/.passwd-s3fs

# 1./etc/fstab 自动挂载
    /etc/fstab:
        devops.zhangyh-test /data_s3/packages/ fuse.s3fs _netdev,allow_other 0 0
    or
        s3fs#devops.zhangyh-test /data_s3/packages/ fuse _netdev,allow_other,use_path_request_style,url=http://url.to.s3/,endpoint=cn-north-1 0 0

# 2.手动挂载
    cn:
    s3fs -o allow_other devops.zhangyh-test /data_s3/packages/ -o passwd_file=~/.passwd-s3fs -o url=http://s3.<region-name>.amazonaws.com.cn -o endpoint=<region-name>                                 //直接挂载,日志在/var/log/messages
    s3fs -o allow_other devops.zhangyh-test /data_s3/packages/ -o passwd_file=~/.passwd-s3fs -o url=http://s3.<region-name>.amazonaws.com.cn -o endpoint=<region-name> -o dbglevel=info -f -o curldbg   //带debug日志输出
    us:
    ......

# 3.查看
    df -h
    Filesystem                 Size  Used Avail Use% Mounted on
    /dev/xvda1                 7.2G  3.8G  3.1G  56% /
    devtmpfs                   3.6G     0  3.6G   0% /dev
    tmpfs                      3.5G     0  3.5G   0% /dev/shm
    tmpfs                      3.5G  338M  3.2G  10% /run
    tmpfs                      3.5G     0  3.5G   0% /sys/fs/cgroup
    /dev/xvdb1                 7.8G  134M  7.3G   2% /var/log
    /dev/mapper/VG--SD-LV--SD  1.1T   66G  985G   7% /data
    tmpfs                      707M     0  707M   0% /run/user/1002
    s3fs                       256T     0  256T   0% /data_s3/packages
# 取消挂载
    umount /data_s3/packages
    
# 参考：
    https://github.com/s3fs-fuse/s3fs-fuse/wiki/FAQ#q-https-connecting-failed-if-bucket-name-includes-dot-    //官方FAQ
    https://aws.amazon.com/cn/blogs/china/s3fs-amazon-ec2-linux/
    https://mp.weixin.qq.com/s/F2YMedm8q2M40MPzwSa9YQ

# 特点
    利用S3fs可以方便的把S3存储桶挂载在用户本地操作系统目录中，但是由于S3fs实际上是依托于Amazon S3服务提供的目录访问接口，所以不能简单的把S3fs挂载的目录和本地操作系统目录等同使用。用户使用S3f3挂载S3存储桶和直接访问S3服务有类似的使用场景。适用于对不同大小文件对象的一次保存（上传），多次读取（下载）。不适用于对已保存文件经常做随机修改，因为每次在本地修改并保存文件内容都会导致S3fs上传新的文件到Amazon S3去替换原来的文件。从访问性能上来说，通过操作系统目录方式间接访问Amazon S3存储服务的性能不如直接使用SDK或CLI接口访问效率高。以本地配置文件方式保存访问密钥的安全性也不如使用EC2 IAM角色方式高。
    通常S3不能提供与本地文件系统相同的性能或语义。进一步来说：
        · 随机写入或追加到文件需要重写整个文件
        · 元数据操作比如列出目录会因为网络延迟原因导致性能较差
        · 最终一致性设计可能临时导致过期数据
        · 没有对文件或目录的原子重命名功能
        · 挂载相同存储桶的多个客户端之间没有相互协调机制
        · 不支持硬链接

# 总结
    利用S3fs可以把共享的Amazon S3存储桶直接挂载在用户服务器本地目录下，应用不需要做修改就可以直接使用Amazon S3存储服务，这种方式可以作为临时解决方案将传统应用快速迁移到AWS平台。
    在已经提供了Amazon EFS（Elastic File System）服务的AWS区域，建议用户优先考虑使用Amazon EFS服务，因为它具有更高的性能。在目前还没有提供EFS服务的AWS区域，用户可以先暂时使用S3fs实现快速业务迁移。然后逐步调整S3数据访问实现方式，最终修改为使用AWS SDK或CLI方式高效并更加安全地访问S3存储服务。




~ the end ~



