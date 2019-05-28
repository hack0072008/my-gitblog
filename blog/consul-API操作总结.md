




conn.kv.delete(key = 'deploy/deployGroup/media-v3/info', recurse = True)
1.recurse,目录递归参数
      删除目录时True  xxx*  匹配删除
      删除key时False  xxx   匹配删除
      
2.key, 删除指定的kv值
      目录 xxx/yyy/
      key  xxx/yyy

3.二者的关系(已测试)
如果删除key 时recurse = True，会删除父级目录及所有key
如果删除目录时recurse = True，会删除目录

如果删除 key时recurse = False，会删除key
如果删除目录时recurse = False，无操作
      
总结：
    删除key，末尾不带/, recurse = False(匹配上删除key,  匹配不上无操作)
    删除目录,末尾带/,   recurse = True (匹配上删除目录, 匹配不上无操作)
    
    
    
    
