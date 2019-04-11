<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2019-04-11
title: python syntax
tags: python,syntax
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: python syntax
status: publish
summary: python syntax
-->


#### 1.getattr,setattr,hasattr语法
```python
class Student(object):
    def __init(self):
        self._score = None
    @property
    def score(self):
        return self._score
    @score.setter
    def score(self, value):
        if not isinstance(value, int):
            raise TypeError('score must integer')
        elif int(value) < 0 or int(value) > 100:
           raise ValueError('score must between 0~100')
        else:
            self._score = value
    def p_score(self, str):
        print "%s, score:%s" % (str, self._score)
        
>>> s = Student()
>>> hasattr(s, 'score')
False
>>> getattr(s, 'score')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 6, in score
AttributeError: 'Student' object has no attribute '_score'
>>> setattr(s, 'age', 20)
>>> hasattr(s, 'age')
True
>>> getattr(s, 'age')
20
>>> s.score = 90
>>> getattr(s, 'score')
90
>>> hasattr(s, 'score')
True
``` 

#### 2.property, xxxx.setter语法
```python
#参考上面demo
s = Student()
s.score = 100 #Student类的settter:def score(self, value)
s.score       #Student类的getter:def score(self)
```






~~待续~~
