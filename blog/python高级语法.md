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
'''
    importlib.util py3特有
    imp            py2特有
'''

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

#class检查
def __file_classes__(self, py_path, py_name):
    '''
        inspect:ismodule(), isclass(), ismethod(), isfunction()
    '''
    import inspect,imp
    mod = imp.load_source(py_name.split('.')[0], py_path + '/' + py_name)
    #mod = importlib.import_module('commCrypt3DES')
    return [item for item in vars(mod).keys() if inspect.isclass(vars(mod)[item])]
        
```
#### 4.自定义异常
```python
#参考：lib64/python2.7/site-packages/django/core/exceptions.py

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


#### 5.sys包
- 获取当前import path
- 获取当前已导入module列表
- 获取当前系统信息和版本等
- 获取当前python版本等

```python
import sys

>>> sys.path
>>> ['', '/usr/lib/python2.7/site-packages/webkit2png-0.8.3-py2.7.egg', '/usr/lib64/python27.zip', '/usr/lib64/python2.7', '/usr/lib64/python2.7/plat-linux2', '/usr/lib64/python2.7/lib-tk', '/usr/lib64/python2.7/lib-old', '/usr/lib64/python2.7/lib-dynload', '/usr/lib64/python2.7/site-packages', '/usr/lib64/python2.7/site-packages/PIL', '/usr/lib/python2.7/site-packages']
>>> sys.modules
>>> {'Crypto.Protocol': <module 'Crypto.Protocol' from '/usr/lib64/python2.7/site-packages/Crypto/Protocol/__init__.pyc'>,...}

help(sys)
    __stderr__ = <open file '<stderr>', mode 'w'>
    __stdin__ = <open file '<stdin>', mode 'r'>
    __stdout__ = <open file '<stdout>', mode 'w'>
    api_version = 1013
    argv = ['']
    builtin_module_names = ('__builtin__', '__main__', '_ast', '_codecs', ...
    byteorder = 'little'
    copyright = 'Copyright (c) 2001-2013 Python Software Foundati...ematis...
    dont_write_bytecode = False
    exc_value = TypeError("<module 'sys' (built-in)> is a built-in module"...
    exec_prefix = '/usr'
    executable = '/usr/bin/python'
    flags = sys.flags(debug=0, py3k_warning=0, division_warn...unicode=0, ...
    float_info = sys.float_info(max=1.7976931348623157e+308, max_...epsilo...
    float_repr_style = 'short'
    hexversion = 34014704
    last_value = NameError("name 'sys' is not defined",)
    long_info = sys.long_info(bits_per_digit=30, sizeof_digit=4)
    maxint = 9223372036854775807
    maxsize = 9223372036854775807
    maxunicode = 1114111
    meta_path = []
    modules = {'Crypto': <module 'Crypto' from '/usr/lib64/python2.7/site-...
    path = ['', '/usr/lib/python2.7/site-packages/webkit2png-0.8.3-py2.7.e...
    path_hooks = [<type 'zipimport.zipimporter'>]
    path_importer_cache = {'': None, '/usr/lib/python2.7/site-packages': N...
    platform = 'linux2'
    prefix = '/usr'
    ps1 = '>>> '
    ps2 = '... '
    py3kwarning = False
    pydebug = False
    stderr = <open file '<stderr>', mode 'w'>
    stdin = <open file '<stdin>', mode 'r'>
    stdout = <open file '<stdout>', mode 'w'>
    subversion = ('CPython', '', '')
    version = '2.7.5 (default, Jul 13 2018, 13:06:57) \n[GCC 4.8.5 2015062...
    version_info = sys.version_info(major=2, minor=7, micro=5, releaseleve...
    warnoptions = []
    
```

#### 6.django源码学习
    参考：http://www.cnblogs.com/richiewlq/category/1148206.html
    


~~待续~~
