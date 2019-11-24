# -*-coding:UTF-8 -*-
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
from selenium import webdriver
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from email.mime.text import MIMEText

#Constant Variables
USERNAME=' '
PASSWORD=' '
URL_LOGIN="https://ids.tongji.edu.cn:8443/nidp/saml2/sso?id=1779&sid=0&option=credential&sid=0"
URL_LIST="http://yjsqd.tongji.edu.cn/PC/#/list"
WANT=['社会文化变迁','国家治理现代化中的制度创新','巨磁阻纳米复合材料','美国高等教育','21世纪解决']
CLICKNUM=[[300,300],[600,300],[900,300],[300,500],[600,500],[900,500]]
SCAN_PAGE=3

MAIL_HOST = 'smtp.163.com' 
USER=" "
PASSWORD=" "
SENDER=USER+"@163.com"
RECEIVERS=[SENDER]

#Functions 
def send_message(title,text,mail_host=MAIL_HOST,user=USER,password=PASSWORD,sender=SENDER,receivers=RECEIVERS):
    '''
    发送邮件告知
    '''
    message = MIMEText(text,'plain','utf-8')
    message['Subject'] = title 
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
    except smtplib.SMTPException as e:
    	pass
        # print('error',e) #打印错误

def go_new_page(browser,url):
    '''
    前往新的页面
    '''
    browser.get(url)
    browser.maximize_window()
    browser.execute_script("document.body.style.zoom='1'")
    time.sleep(1.5)

def go_list_page(number):
    '''
    前往number页面
    '''
    return(URL_LIST+"?page="+str(number))

def click_locxy(dr, x, y, left_click=True):
    '''
    dr:浏览器
    x:页面x坐标
    y:页面y坐标
    left_click:True为鼠标左键点击，否则为右键点击
    '''
    time.sleep(1.5)
    if left_click:
        ActionChains(dr).move_by_offset(x, y).click().perform()
    else:
        ActionChains(dr).move_by_offset(x, y).context_click().perform()
    ActionChains(dr).move_by_offset(-x, -y).perform()  # 将鼠标位置恢复到移动前

def get_idcode(browser):
    '''
    获得验证码
    '''
    browser.find_element_by_id("ehong-code")
    soup = BeautifulSoup(browser.page_source,'lxml')
    divs = soup.find('div',attrs={'class':'wrap'})
    a = divs.find('span',attrs={'id':'idcode'})
    fonts=a.find_all('font')
    key=""
    for i in range(0,4):
        key=key+fonts[i].text
    return(key)

def get_url(browser):
    '''
    使用新的cookie前往网站
    '''
    url2="http://yjsqd.tongji.edu.cn/PC/#/list"
    cookie = "; ".join([item["name"] + "=" + item["value"] for item in browser.get_cookies()])
    HEADERS = {
        # 通过 fake_useragent 组件随机生成浏览器请求信息
        'User_Agent': UserAgent().random,
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language': 'zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3',
        'Accept-Encoding': 'gzip,deflate,br',
        'Content-Type': 'text/html;charset=UTF-8',
        'Cookie': cookie,
        'Connection': 'keep-alive',
        'Pragma': 'no-cache',
        'Cache-Control': 'no-cache'
    }
    response = requests.post(url2, headers=HEADERS,allow_redirects=False,timeout=5) #allow_redirects=False
    with open('test1.html','wb') as f:  
        f.write(response.content)

def click_yes(browser):
    '''
    点击list页面中的确定
    '''
    browser.maximize_window()
    browser.execute_script("document.body.style.zoom='1'")
    time.sleep(1.5)
    # click_locxy(browser,YES_LOCATION[0],YES_LOCATION[1]) #确定
    location=find_location(browser,"确定")
    click_locxy(browser,location["x"]+10,location["y"]+10)

def click_sign(browser):
    '''
    点击登录页面中的登录
    '''
    browser.maximize_window()
    browser.execute_script("document.body.style.zoom='1'")
    time.sleep(1.5)
    # click_locxy(browser,SIGN_LOCATION[0],SIGN_LOCATION[1]) #登录
    location=find_location(browser,"登录")
    click_locxy(browser,location["x"]+10,location["y"]+10)


def find_location(browser,text):
    '''
    寻找button的位置
    '''
    eles=browser.find_elements_by_tag_name("button")
    for i in range(0,len(eles)):
        location=[]
        location=eles[i].location
        # click_locxy(browser,location["x"],location["y"],False)
        if(eles[i].text==text):
            location=eles[i].location
            return(location)
    if(location==[]):
        return None

def sign_in(browser,url=URL_LOGIN):
    '''
    登录页面登录
    '''
    try:
        go_new_page(browser,url)
        browser.find_element_by_id("username").clear()
        browser.find_element_by_id("username").send_keys(USERNAME)
        browser.find_element_by_id("password").clear()
        browser.find_element_by_id("password").send_keys(PASSWORD)
        browser.find_element_by_id("Txtidcode").clear()
        browser.find_element_by_id("Txtidcode").send_keys(get_idcode(browser))
        browser.find_element_by_name("btsubmit").click()
    except:
        pass

def scan_free(browser,want_list):
    '''
    查找空余课程
    '''
    for page in range(1,SCAN_PAGE+1):
        go_new_page(browser,go_list_page(page))
        browser.maximize_window()
        browser.execute_script("document.body.style.zoom='1'")
        time.sleep(1.5)
        soup = BeautifulSoup(browser.page_source,'lxml')
        items = soup.find_all('li',attrs={'class','item'})
        freelist=[]
        for i in range(0,len(items)):
            it1=items[i].text.find("已报满")
            it2=items[i].text.find("已结束")
            if(it1<0 and it2<0):
                for j in want_list:
                    if(items[i].text.find(j)>0):
                        # click_number(browser,i+1)
                        time.sleep(1.5)
                        location=browser.find_element_by_xpath("//*[@id='app']/div/div[2]/div[1]/div[2]/li["+str(i+1)+"]/div[2]").location
                        click_locxy(browser,location["x"]+10,location["y"]+10) #click
                        time.sleep(1.5)
                        location=browser.find_element_by_xpath("//*[@id='app']/div/div[2]/div/div/div[1]/div/button").location
                        click_locxy(browser,location["x"]+10,location["y"]+10) #click
                        time.sleep(1.5)
                        browser.save_screenshot('screenshot'+str(int(time.time()))+'.png')
                        with open('save'+str(int(time.time()))+'.html','wb') as f:
                            f.write(browser.page_source.encode('gbk','ignore'))
                        go_new_page(browser,go_list_page(page))
                        time.sleep(1.5)
                        send_message(str(j),"Time:"+str(time.time())+"\nCourses:"+str(j))
            else:
                pass


def click_number(browser,number):
    '''
    点击页面中第number个课程
    '''
    go_new_page(browser,URL_LIST)
    browser.maximize_window()
    browser.execute_script("document.body.style.zoom='1'")
    time.sleep(1.5)
    click_locxy(browser,CLICKNUM[number-1][0],CLICKNUM[number-1][1]) #click
    time.sleep(1.5)
    location=browser.find_element_by_xpath("//*[@id='app']/div/div[2]/div/div/div[1]/div/button").location
    click_locxy(browser,location["x"]+10,location["y"]+10) #click
    time.sleep(1.5)


if __name__ == '__main__':
    # send_message(str(USER),"Time:"+str(time.time())+"\nCourses:"+str(USER))
    browser = webdriver.Chrome()
    try:
        go_new_page(browser,URL_LOGIN)
        sign_in(browser)
        go_new_page(browser,URL_LIST)
        try:
            browser.find_element_by_class_name("el-message-box__wrapper")
            click_yes(browser)
            time.sleep(1.5)
            click_sign(browser)
        except:
            pass
        while(True):
            scan_free(browser,WANT)
    except:
        browser.save_screenshot('screenshot'+str(int(time.time()))+'.png')
        with open('save'+str(int(time.time()))+'.html','wb') as f:
            f.write(browser.page_source.encode('gbk','ignore'))
    finally:
        browser.close()


# try:
#     browser.get(URL_LIST)
#     WebDriverWait(browser, 1).until(EC.presence_of_all_elements_located(browser.find_elements_by_tag_name("button")))
#     print("Page is ready!")
# except TimeoutException:
#     print("Loading took too much time!")