<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2018-10-14
title: gitlab的备份与恢复
tags: gitlab
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: gitlab
status: publish
summary: gitlab备份与恢复
-->



# 备份参考：
    https://www.cnblogs.com/kevingrace/p/7821529.html

# 备份与恢复参考：
    https://blog.csdn.net/jenyzhang/article/details/53928438
    
    


# 备份：
    gitlab-rake gitlab:backup:create
        (默认备份文件储存在   /var/opt/gitlab/backups/140623891_gitlab_backup.tar)
        
# 恢复：
    cp 140623891_gitlab_backup.tar  /var/opt/gitlab/backups/ 
    gitlab-ctl stop unicorn
    gitlab-ctl stop sidekiq
    gitlab-rake gitlab:backup:restore BACKUP=140623891   -- 备份文件名的时间戳前缀
    gitlab-ctl start
    gitlab-rake gitlab:check SANITIZE=true

# 设置定时备份
    0 2 * * * /opt/gitlab/bin/gitlab-rake gitlab:backup:create CRON=1

# 设置备份保存七天
    /etc/gitlab/gitlab.rb
    gitlab_rails['backup_keep_time'] = 604800

# 重新加载gitlab配置文件
    sudo gitlab-ctl reconfigure

