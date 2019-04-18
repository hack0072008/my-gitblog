<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2019-04-17
title: python-markdown
tags: python,markdown
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: python markdown
status: publish
summary: python-markdown使用
-->


#### install
    pip install markdown

#### useage
```shell
shell:
    markdown_py -o html -x nl2br -x tables -x fenced_code -x abbr python-syntax.md -f python-syntax.html
```
```python
python:
    import codecs, markdown
    from markdown.extensions.abbr import AbbrExtension
    from markdown.extensions.fenced_code import FencedCodeExtension
    
    input_file = codecs.open("some_file.md", mode="r", encoding="utf-8")
    text = input_file.read()
    
    html = markdown.markdown(text, extensions=['nl2br', 'fenced_code'])
    
    output_file = codecs.open("some_file.html", mode="w", encoding="utf-8")
    output_file.write(html)
```

#### supported-extensions:
    https://python-markdown.github.io/extensions/#officially-supported-extensions

#### doc
    https://python-markdown.github.io/cli/
    https://python-markdown.github.io/extensions/
    https://github.com/Python-Markdown/markdown/wiki/Third-Party-Extensions

#### 参考文档:
    https://www.jianshu.com/p/0eff6cba1b7f
    
    


~~~~完~~~~
