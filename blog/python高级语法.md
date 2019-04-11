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

#### 3.importlib语法
```python

#动态引入
#importer.py
import importlib

def dynamic_import(module):
    return importlib.import_module(module)

if __name__ == "__main__":
    module = dynamic_import('foo')
    module.main()

    module_two = dynamic_import('bar')
    module_two()

#模块引入检查
import importlib.util
import importlib
def check_module(module_name):
    module_spec = importlib.util.find_spec(module_name)
    if module_spec is None:
        print("Module :{} not found".format(module_name))
        return None
    else:
        print("Module:{} can be imported!".format(module_name))
        return module_spec
    
def import_module_from_spec(module_spec):
    module = importlib.util.module_from_spec(module_spec)
    module_spec.loader.exec_module(module)
    return module
    
if __name__ == "__main__":
    module_spec = check_module("fake_module")
    module_spec = check_module("collections")
    if(module_spec):
        module = import_module_from_spec(module_spec)
        print(dir(module))

#从源文件中引入
import importlib.util
def import_source(module_name):
    module_file_path = module_name.__file__
    module_name = module_name.__name__
    
    module_spec = importlib.util.spec_from_file_location(module_name,module_file_path)
    module = importlib.util.module_from_spec(module_spec)
    module_spec.loader.exec_module(module)
    print(dir(module))

    msg = "The {module_name} module has the following methods:{methods}"
    print(msg.format(module_name = module_name,methods = dir(module)))
    
if __name__ == "__main__":
    import logging
    import_source(logging)
    
#import_from_github_com
>>> from github_com.zzzeek import sqlalchemy
Collecting git+https://github.com/zzzeek/sqlalchemy
Cloning https://github.com/zzzeek/sqlalchemy to /tmp/pip-acfv7t06-build
Installing collected packages: SQLAlchemy
Running setup.py install for SQLAlchemy ... done
Successfully installed SQLAlchemy-1.1.0b1.dev0
>>> locals()
{'__builtins__': <module 'builtins' (built-in)>, '__spec__': None,
'__package__': None, '__doc__': None, '__name__': '__main__',
'sqlalchemy': <module 'sqlalchemy' from '/usr/local/lib/python3.5/site-packages/\
sqlalchemy/__init__.py'>,
'__loader__': <class '_frozen_importlib.BuiltinImporter'>}


```
#### 4.自定义异常
```python
class ValidationError(Exception):
    def __init__(self, message, code=None, params=None):
        """The requested model field does not exist"""
        super(ValidationError, self).__init__(message, code, params)
    
    def __iter__(self):
        if hasattr(self, 'error_dict'):
            for field, errors in self.error_dict.items():
                yield field, list(ValidationError(errors))
        else:
            for error in self.error_list:
                message = error.message
                if error.params:
                    message %= error.params
                yield force_text(message)

    def __str__(self):
        if hasattr(self, 'error_dict'):
            return repr(dict(self))
        return repr(list(self))

    def __repr__(self):
        return 'ValidationError(%s)' % self

```



~~待续~~
