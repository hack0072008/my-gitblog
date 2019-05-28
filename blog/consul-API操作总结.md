<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2019-05-28
title: consul-API操作总结
tags: consul-API python
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: consul
status: publish
summary: consul-API操作总结
-->



#### 案例一 kv.delete：
    conn.kv.delete(key = 'deploy/deployGroup/media/info', recurse = True)
    - 如果info是key且存在，则会删除info*的所有key,media目录保留；
      如果info是key且不存在，则无操作,media目录保留
    - 如果info是目录且存在，则会删除info*的所有key和目录,media目录保留；
      如果info是目录且不存在，则无操作,media目录保留

#### 总结一 kv.delete：
1. recurse,目录递归参数
   - 删除目录时True  xxx*  匹配删除
   - 删除key时False  xxx   匹配删除
      
2. key, 删除指定的kv值
   - 目录 xxx/yyy/
   - key  xxx/yyy

3. 二者的关系(已测试)
   - 如果删除key 时recurse = True，会删除父级目录及所有key
   - 如果删除目录时recurse = True，会删除目录
   - 如果删除 key时recurse = False，会删除key
   - 如果删除目录时recurse = False，无操作
      
4. 总结：
   - 删除key，末尾不带/, recurse = False(匹配上删除key,  匹配不上无操作)
   - 删除目录,末尾带/,   recurse = True (匹配上删除目录, 匹配不上无操作)
    
    
    
    
