# -*- coding: utf-8 -*-
# author = ChenZixuan
import csv
import urllib
import requests
import numpy as np
import time
import io,sys
import smtplib
from urllib import parse
from fake_useragent import UserAgent
from bs4 import BeautifulSoup
from time import sleep
from wxpy import *
from email.mime.text import MIMEText
mail_host = ' ' 
user=" "
password=" "
sender=user+"@163.com"
receivers=[sender]

if __name__ == '__main__':
    message = MIMEText('content','plain','utf-8')
    message['Subject'] = 'title' 
    message['From'] = sender 
    message['To'] = receivers[0]
    try:
        smtpObj = smtplib.SMTP() 
        #连接到服务器
        smtpObj.connect(mail_host,25)
        #登录到服务器
        smtpObj.login(user,password) 
        #发送
        smtpObj.sendmail(
            sender,receivers,message.as_string()) 
        #退出
        smtpObj.quit() 
        print('success')
    except smtplib.SMTPException as e:
        print('error',e) #打印错误

#wxpy
# bot = Bot()
# my_friend = bot.friends().search('游否', sex=MALE, city="深圳")[0]
# my_friend.send('Hello WeChat!')
# my_friend.send_image('my_picture.jpg')
