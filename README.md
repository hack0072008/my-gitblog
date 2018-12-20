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
     在 gitblog/theme/xxxx/index.html 中找到对应的子文件，去掉即可，例如default主题：gitblog/theme/default/index.html 内容的 block/footer.html 中修改原作者信息

#### 增加广告推广统计：
     在 gitblog/theme/xxxx/index.html 找到 能填写 head 部分内容,贴上广告商代码, 例如default主题：gitblog/theme/default/index.html 内容的 block/base.html 中的 head 下贴上google-ads代码即可

####  default主题的尾部模板增加二维码
     在 gitblog/theme/xxxx/index.html 中找到对应的子文件，去掉即可，例如default主题：gitblog/theme/default/index.html 内容的 block/footer.html 中保存二维码信息：
     <img src="https://www.etcunion.com/static/qrcode.gif" width="369" height="369" alt="gif qrcode" />

#### chrome 登陆googole用户一直101错误：
     chrome 关闭SwitchyOmega,挂上ss，登陆成功后一次后，在开启SwitchyOmega，即可正常使用.
     
#### 增加访问次数统计：
     https://busuanzi.ibruce.info/
     修改 ./theme/default/block/footer.html,<div class="site-info">标签下：
        <hr>
        <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
        <span id="busuanzi_container_site_pv">本站总访问量<span id="busuanzi_value_site_pv"></span>次</span>
        <br>
        
#### 支持blog列表的github用户链接：
     修改 ./theme/default/blog/footer.html  中 < {{ blog.author }} >修改为:
     <a href="https://github.com/{{ category.url }}" rel="author">{{ blog.author }}</a>

#### blog增加两大评论系统，disqus 和 gitalk:
     一.disqus本身自带，只是需要在conf.yaml中增加配置项:disqus,值为disqus的用户名即可,例如：
        conf.yaml:
            disqus: zhangyh
        参考：
            https://www.jianshu.com/p/7e4453421b8f
            
     二.gitalk评论系统,修改：theme/default/block/comments.html，增加相应代码
        a.github中增加oauth apps授权(对域名和主页授权，创建一个apps)，得到ID和Secret
        b.github创建存放评论的仓库,比如myblog-issue
        c.修改以下代码中的参数gitalk的主要参数，然后贴到theme/default/block/comments.html中：
            <!-- Gitalk 评论 start  -->
            
            <!-- Link Gitalk 的支持文件  -->
            <link rel="stylesheet" href="https://unpkg.com/gitalk/dist/gitalk.css">
            <script src="https://unpkg.com/gitalk@latest/dist/gitalk.min.js"></script> 
            <div id="gitalk-container"></div>     <script type="text/javascript">
                var gitalk = new Gitalk({
            
                // gitalk的主要参数
            		clientID: `Github Application clientID`,
            		clientSecret: `Github Application clientSecret`,
            		repo: `存储你评论 issue 的 Github 仓库名`,
            		owner: 'Github 用户名',
            		admin: ['Github 用户名'],
            		id: '页面的唯一标识，gitalk会根据这个标识自动创建的issue的标签',
                
                });
                gitalk.render('gitalk-container');
            </script> 
            <!-- Gitalk end -->
        d.评论汇总在：https://github.com/hack0072008/myblog-issue/issues
        参考：
            http://qiubaiying.top/2017/12/19/%E4%B8%BA%E5%8D%9A%E5%AE%A2%E6%B7%BB%E5%8A%A0-Gitalk-%E8%AF%84%E8%AE%BA%E6%8F%92%E4%BB%B6/
     
##### 路由标头信息:
     author: 博客作者名称 
     date: 博客时间，用于页面显示，通常来说你不需要填写这个字段，默认就是创建日期 
     title: 博客标题 
     tags: 博客里的标签，多个用逗号或空格分隔 
     category: 博客分类，多个用逗号或空格分隔 
     status: 博客状态，draft表示草稿，GitBlog解析时会忽略草稿；publish表示发表状态，默认为publish 
     summary: 博客摘要信息 以上所有信息都是独占一行，暂不支持写在多行。

