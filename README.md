# gitblog

#### doc:
     https://www.bookstack.cn/read/gitblog/README.md

#### install package:
     参考：
         yum|apt-get install
         
         nginx,php,php-mysql,php-fpm,php-mbstring

#### clone gitblog:
     cd /var/www/
     wget https://github.com/jockchou/gitblog/archive/v2.3.2.tar.gz
     tar zxvf v2.3.2.tar.gz
     mv gitblog-2.3.2 gitblog && rm -rf v2.3.2.tar.gz
     cd gitblog
     git clone https://github.com/hack0072008/my-gitblog
     mv my-gitblog/blog/* ./blog/
     
     cp gitblog.conf /etc/nginx/conf.d/
     cp conf.yaml /var/www/gitblog/
     cp index.php /var/www/
     rm -rf my-gitblog
     
#### modify config:
     #php.ini 中的short_open_tag = On：
     vim /etc/php/7.0/fpm/php.ini (ubuntu)
     vim /etc/php.ini             (centos)
     
     #apache中的端口(改成非80、443,停用，否则会导致nginx端口冲突)：
     vim /etc/apache2/ports.conf     (ubuntu)
     vim /etc/http.d/conf/httpd.conf (centos)
     
     #停止apache
     systemctl stop httpd
     /etc/init.d/apache2 stop
     
     #修改nginx的gitblog.conf配置(hostname,port)
     vim gitblog.conf
     //注意：如果有域名需要修改域名对应的A记录的解析IP地址

#### start blog:
     /etc/init.d/nginx restart  or systemctl restart nginx
     /etc/inid./apache2 restart or systemctl stop httpd

#### open blog:
     http://hostname:port/ or https://www.xxx.com:port/
     
#### 去掉原作者信息：
     在 gitblog/theme/xxxx/index.html 中找到对应的子文件，去掉即可，例如default主题：gitblog/theme/default/index.html 内容的 block/footer.html 中保存原作则信息
     
##### format:
     author: 博客作者名称 
     date: 博客时间，用于页面显示，通常来说你不需要填写这个字段，默认就是创建日期 
     title: 博客标题 
     tags: 博客里的标签，多个用逗号或空格分隔 
     category: 博客分类，多个用逗号或空格分隔 
     status: 博客状态，draft表示草稿，GitBlog解析时会忽略草稿；publish表示发表状态，默认为publish 
     summary: 博客摘要信息 以上所有信息都是独占一行，暂不支持写在多行。

