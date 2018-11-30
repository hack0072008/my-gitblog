# my-gitblog

#### install package:
     参考：
         https://github.com/hack0072008/personal_note/blob/master/my-gitblog.md 安装部分

#### clone gitblog:
     cd /var/www/
     git clone https://github.com/hack0072008/my-gitblog
     
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
