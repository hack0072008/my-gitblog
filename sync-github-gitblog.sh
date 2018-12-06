#!/bin/bash


#git clone github my-gitblog
cd /opt/src/github/my-gitblog
ls -ltrh ./blog/
git pull

#copy blog files to local gitblog
cd /opt/src/github/my-gitblog
/bin/cp -rf ./blog/* /var/www/gitblog/blog/

#list local gitblog
ls -ltrh /var/www/gitblog/blog

