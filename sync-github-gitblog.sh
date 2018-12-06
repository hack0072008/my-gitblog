#!/bin/bash


#git clone github my-gitblog
cd /opt/src/github/my-gitblog
ls -ltrh ./blog/
git pull

#copy blog files to local gitblog
cd /opt/src/github/my-gitblog
/bin/cp -rf ./blog/* /var/www/gitblog/blog/

#copy gitblog theme to local gitblog theme
cd /opt/src/github/my-gitblog
/bin/cp -rf ./theme/* /var/www/gitblog/theme/

#copy gitblog static to local gitblog  static
cd /opt/src/github/my-gitblog
/bin/cp -rf ./static/* /var/www/gitblog/static/
/bin/cp -rf ./*.ico /var/www/gitblog/
/bin/cp -rf ./*.png /var/www/gitblog/
/bin/cp -rf ./*.gif /var/www/gitblog/

#copy gitblog config to local gitblog  config
cd /opt/src/github/my-gitblog
/bin/cp -rf ./conf.yaml /var/www/gitblog/

#list local gitblog
ls -ltrh /var/www/gitblog/blog

