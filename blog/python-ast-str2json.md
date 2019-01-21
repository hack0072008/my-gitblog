<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2019-01-21
title: python的ast模块之literal_eval妙用
tags: python,ast
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: python
status: publish
summary: python的ast模块之literal_eval妙用
-->



#### python ast module
    import ast
    
    python解析执行的过程：
        词法分析 --> 具体语法树 --> 抽象语法树 --> 控制流图 --> 字节码 --> 执行
    
    ast提供了访问和修改上述中抽象语法树的功能
    参考：
        https://zhuanlan.zhihu.com/p/21945624
   
   
#### 利用ast.literal_eval 转换 `字符串` 到 `json对象`
```python
    import ast
    import json
    str = "{\"errcode\":0,\"errmsg\":\"ok\",\"invaliduser\":\"\"}"
    dict = ast.literal_eval(str)

    type(str)
    <type 'str'>
    type(ast.literal_eval(str))
    <type 'dict'>
    
    #request
    json.loads(ast.literal_eval(response.text))['errcode']
    
```
