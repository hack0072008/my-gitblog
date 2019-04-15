<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2019-04-15
title: django模糊匹配和大小写 
tags: python django
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: python django filter
status: publish
summary: django模糊匹配和大小写
-->


#### example:
```python
from django.db.models import Q
if(request.GET.has_key('search')):
    search = request.GET.get('search')
    logger.info(search)
    jobs_set = models.Deploy.objects.filter(Q(deployName__contains=search) | Q(submit__icontains=search)).order_by(order_by)[offset:offset+limit]
    total = models.Deploy.objects.filter(Q(deployName__contains=search) | Q(submit__contains=search)).count()
else:
    logger.info("NOSEARCH")
    jobs_set = models.Deploy.objects.all().order_by(order_by)[offset:offset+limit]
    total = models.Deploy.objects.count()
```

#### django 多个filter模糊匹配:
    .filter( Q(colName1 = search1) | Q(colName2 = search2) )

#### django 是否匹配大小写:
    colName1__contains = search1    #精确匹配大小写, 'LIKE BINARY %s'
    colName2__icontains = search2   #忽略大小写, 'LIKE %s'
