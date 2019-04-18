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
:joy: https://www.webfx.com/tools/emoji-cheat-sheet/
:star:
:sparkles:
:star2:
:earth_asia:
:cn:
:one:
:u7981:
:x:
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

- Extra	                extra       markdown.extensions.extra
  - Abbreviations	    abbr	    markdown.extensions.abbr
  - Attribute Lists	    attr_list	markdown.extensions.attr_list
  - Definition Lists    def_list	markdown.extensions.def_list
  - Fenced Code Blocks	fenced_code	markdown.extensions.fenced_code
  - Footnotes	        footnotes	markdown.extensions.footnotes
  - Tables	            tables	    markdown.extensions.tables
- Admonition	        admonition	markdown.extensions.admonition
- CodeHilite	        codehilite	markdown.extensions.codehilite
- Legacy                Attributes	legacy_attr	markdown.extensions.legacy_attr
- Legacy Emphasis	    legacy_em	markdown.extensions.legacy_em
- Meta-Data	            meta	    markdown.extensions.meta
- New Line to Break	    nl2br	    markdown.extensions.nl2br
- Sane Lists	        sane_lists	markdown.extensions.sane_lists
- SmartyPants	        smarty	    markdown.extensions.smarty
- Table of Contents	    toc	        markdown.extensions.toc
- WikiLinks	            wikilinks	markdown.extensions.wikilinks

#### doc
    https://python-markdown.github.io/cli/
    https://python-markdown.github.io/extensions/
    https://github.com/Python-Markdown/markdown/wiki/Third-Party-Extensions

#### 参考文档:
    https://www.jianshu.com/p/0eff6cba1b7f
    
    


~~~~完~~~~
