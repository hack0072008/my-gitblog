# my-gitblog

#### install package:
     参考：
         https://github.com/hack0072008/personal_note/blob/master/my-gitblog.md 安装部分

#### clone gitblog:
     cd /var/www/
     wget https://github.com/jockchou/gitblog/archive/v2.3.2.tar.gz
     tar zxvf v2.3.2.tar.gz
     mv gitblog-2.3.2 gitblog && rm -rf v2.3.2.tar.gz
     cd gitblog
     git clone https://github.com/hack0072008/my-gitblog
     mv my-gitblog/blog/* ./blog/
     rm -rf my-gitblog
     
#### modify config:
     cd /var/www/my-gitblog
     vim apache2-ports.conf:port
     vim nginx-conf.d-blog.conf: hostname,port
     //注意：如果有域名需要修改域名对应的A记录的解析IP地址

#### copy config:
     cd /var/www/my-gitblog
     cp apache2-ports.conf /etc/apache2/ports.conf
     cp nginx-conf.d-blog.conf /etc/nginx/conf.d/blog.conf
     cp var-www-index.php /var/www/index.php
     
#### start blog:
     /etc/init.d/nginx restart
     /etc/inid./apache2 restart

#### open blog:
     http://hostname:port/ or http://www.xxx.com:port/

##### format:
     author: 博客作者名称 
     date: 博客时间，用于页面显示，通常来说你不需要填写这个字段，默认就是创建日期 
     title: 博客标题 
     tags: 博客里的标签，多个用逗号或空格分隔 
     category: 博客分类，多个用逗号或空格分隔 
     status: 博客状态，draft表示草稿，GitBlog解析时会忽略草稿；publish表示发表状态，默认为publish 
     summary: 博客摘要信息 以上所有信息都是独占一行，暂不支持写在多行。

