<!--
author: hack0072008
head: http://www.etcunion.com/static/logo1_128x128.jpg
date: 2019-04-11
title: windown下python发送QQ消息
tags: python,qq,windows
images: http://www.etcunion.com/static/logo1_128x128.jpg
category: python
status: publish
summary: python QQ消息 windows
-->

#### 说明
    在window x64下python3.7.3 给已登录的QQ指定好友发送指定的消息,再结合flask转化为http模式,测试成功
    遗留问题：QQ组合键发送消息测试不通过

```python

#!/usr/bin/python                                                                                                                                                                                                                                                             
#-*-coding:utf-8-*-
# vim: tabstop=4 shiftwidth=4 softtabstop=4
# copyright 2019 xxxx, Inc.
# All Rights Reserved.

# @author: ZhangYh, xxxx, Inc.


'''
example:
    https://blog.csdn.net/suzyu12345/article/details/52934328
    http://www.cnblogs.com/417xiaoliu/p/6898419.html

note:
    以前看到网上一些小程序，在处理完事物后会自动发送qq消息，但是一直搞不懂是说明原理。也在网上找过一些python登陆qq发送消息的文字，但是都太复杂了。今天偶然看到一篇文章，是用python调用win32的接口发送qq消息的，觉得不错，就先记录下来，日后肯定会用得上这些小工具。 
发送qq消息要求已经登陆qq，而且qq的窗口是独立的，现在新版的qq一般都是将所有的聊天窗口聚合在一起，因此要设置将qq窗口分离，或者将需要发送消息的那个窗口单独分离出来。 
上代码吧。

useage:
    python:
        import requests
        requests.post(url = 'http://192.168.1.101:5001/api/qqMsg', headers = {'Content-Type' : 'application/x-www-form-urlencoded'}, data = {'recv_buddy' : '张三', 'message' : '来一发,v1.0.3'} )
'''

'''
windows 64(专业版)
python 3.7.3
pip install pywin32

QQ9.0.1(23161)
QQ设置：
1.单独会话窗口模式(非合并窗口)
2.回车发送消息(热键)
3.已登录,并打开待发送的会话窗口
'''


# 原理是先将需要发送的文本放到剪贴板中，然后将剪贴板内容发送到qq窗口
# 之后模拟按键发送enter键发送消息

import win32gui
import win32con
import win32clipboard as w

from flask import request, Flask, redirect, url_for, render_template, Response
from flask import jsonify
from flask import abort
from flask import redirect

import urllib
import json




def getText():
    """获取剪贴板文本"""
    w.OpenClipboard()
    d = w.GetClipboardData(win32con.CF_UNICODETEXT)
    w.CloseClipboard()
    return d

def setText(aString):
    """设置剪贴板文本"""
    w.OpenClipboard()
    w.EmptyClipboard()
    w.SetClipboardData(win32con.CF_UNICODETEXT, aString)
    w.CloseClipboard()

def send_qq(to_who, msg):
    """发送qq消息
    to_who：qq消息接收人
    msg：需要发送的消息
    """
    # 将消息写到剪贴板
    setText(msg)
    # 获取qq窗口句柄
    qq = win32gui.FindWindow(None, to_who)
    # 投递剪贴板消息到QQ窗体
    win32gui.SendMessage(qq, 258, 22, 2080193)
    win32gui.SendMessage(qq, 770, 0, 0)
    
    # 模拟按下回车键
    win32gui.SendMessage(qq, win32con.WM_KEYDOWN, win32con.VK_RETURN, 0)
    win32gui.SendMessage(qq, win32con.WM_KEYUP, win32con.VK_RETURN, 0)
    
    # 模拟组合键: CTRL + 回车键(未成功)
    #win32gui.SendMessage(qq, win32con.WM_KEYDOWN, win32con.VK_CONTROL, 0)
    #win32gui.SendMessage(qq, win32con.WM_KEYDOWN, win32con.VK_RETURN, 0)
    #win32gui.SendMessage(qq, win32con.WM_KEYUP, win32con.VK_CONTROL, 0)
    #win32gui.SendMessage(qq, win32con.WM_KEYUP, win32con.VK_RETURN, 0)


# 测试
#to_who='哈哈哈'
#msg='这是测试v1.0.2'
#send_qq(to_who, msg)


app = Flask(__name__)
@app.route('/index', methods = ['GET'])
def index():
    return jsonify( { "errno" : 200,"errmsg" : u"成功" } )

@app.route('/api/qqMsg', methods=['POST','GET'])
def toQqMsq():
    if request.method == 'POST':
        recv_buddy = request.form.get('recv_buddy', None)
        message = request.form.get('message', None)
        
        print('recv_buddy:%s' % recv_buddy)
        print('message:%s' % message)
        if recv_buddy is  None or message is None:
            return jsonify( { "errno" : 1001,"errmsg" : u"参数错误" } )
        send_qq(recv_buddy, message)
        print('发送到[%s] 消息内容[%s] 成功' % (recv_buddy, message))
        return jsonify( { "errno" : 200,"errmsg" : u"发送成功" } )
    else:
        abort(404)


#main
if __name__ == '__main__':
    app.run(host = '0.0.0.0', port = '5001', debug = True)
    

```
