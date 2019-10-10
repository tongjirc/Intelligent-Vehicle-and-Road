# -*- coding: utf-8 -*-
# author = ChenZixuan
import csv
import urllib
import requests
import pandas as pd
import numpy as np
import time
import matplotlib.pyplot as plt
import random
from math import ceil
from urllib import parse
from fake_useragent import UserAgent
from bs4 import BeautifulSoup
from time import sleep
from pyecharts import options as opts
from pyecharts.charts import Geo, Page, Bar,Map
from pyecharts.faker import Collector, Faker                
from pyecharts.globals import ChartType, SymbolType


HEADERS = {
    # 通过 fake_useragent 组件随机生成浏览器请求信息
    'User_Agent': UserAgent().random,
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
    'Accept-Language': 'zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3',
    'Accept-Encoding': 'gzip,deflate,br',
    'Cookie': '',
    'Connection': 'keep-alive',
    'Pragma': 'no-cache',
    'Cache-Control': 'no-cache'
}
FILE='qunar.csv'
ADDRESSFILE='AMap_adcode_citycode.csv'
address=pd.read_csv(ADDRESSFILE, engine='python')
csvfile = open('qunar.csv', 'w', newline='')
writer = csv.writer(csvfile)
writer.writerow(["areas", "name", "id", "type", "class","hot", "address", "feature", "Pos"])
new_data='110.86.139.154:9999'

class City():
    cityName=''
    hotValue=0
    scenename=''

def get_random_ip():
    """
    获取代理ip
    """
    url = 'http://www.xicidaili.com/nn/'
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36'
    }
    web_data = requests.get(url, headers=headers)
    soup = BeautifulSoup(web_data.text, 'lxml')
    ips = soup.find_all('tr')
    ip_list = []
    for i in range(1, len(ips)):
        ip_info = ips[i]
        tds = ip_info.find_all('td')
        ip_list.append(tds[1].text + ':' + tds[2].text)
    proxy_list = []
    for ip in ip_list:
        proxy_list.append('http://' + ip)
    proxy_ip = random.choice(proxy_list)
    proxies = {'http': proxy_ip}
    return proxies

def data_clean():
    #清理异常数据
    qunar = pd.read_csv(FILE, engine='python')
    qunar.drop_duplicates('id',keep='first',inplace=True)
    qunar.to_csv('qunar1.csv', encoding='gbk',index=False)
    return True

def load_file():
    #打开csv文件
    with open("qunar.csv","r") as csvfile:
        reader=csv.reader(csvfile)
        #开始绘图
        cityList = []
        #根据规则读取文件中的文字
        for line in reader:
            if len(line[0].split('·'))>1:
                city=City()
                city.cityName=line[0].split('·')[1]
                city.hotValue=float(line[5].split(' ')[1])

                foundRepeatCity=0
                #获取城市名字和热度信息
                #针对城市名字做联合操作，也就是针对其做热点求和
                for originCity in cityList:
                    if originCity.cityName==city.cityName:
                        originCity.hotValue=originCity.hotValue + city.hotValue
                        foundRepeatCity=1
                        break
                if foundRepeatCity ==0 and Geo().get_coordinate(name=city.cityName) != None and int(city.hotValue) !=0:
                    cityList.append(city)
        #生成输出信息，传入图标
        outputGeoData= []
        for city in cityList:
            if Geo().get_coordinate(name=city.cityName) !=None and round(city.hotValue) != 0:
                outputGeoDataRecord =(city.cityName,int(city.hotValue)*1.25)
                outputGeoData.append(outputGeoDataRecord)
    return outputGeoData

def load_province():
    #打开csv文件
    with open("qunar.csv","r") as csvfile:
        reader=csv.reader(csvfile)
        #开始绘图
        cityList = []
        #根据规则读取文件中的文字
        for line in reader:
            if len(line[0].split('·'))>1:
                city=City()
                city.cityName=line[0].split('·')[0]
                city.hotValue=float(line[5].split(' ')[1])
                foundRepeatCity=0
                #获取城市名字和热度信息
                #针对城市名字做联合操作，也就是针对其做热点求和
                for originCity in cityList:
                    if originCity.cityName==city.cityName:
                        originCity.hotValue=originCity.hotValue + city.hotValue
                        foundRepeatCity=1
                        break
                if foundRepeatCity ==0 and Geo().get_coordinate(name=city.cityName) != None and round(city.hotValue) !=0:
                    cityList.append(city)
        #生成输出信息，传入图标
        outputGeoData= []
        for city in cityList:
            if Geo().get_coordinate(name=city.cityName) !=None and int(city.hotValue) != 0:
                outputGeoDataRecord =(city.cityName,int(city.hotValue)*1.25)
                outputGeoData.append(outputGeoDataRecord)
    return outputGeoData

def geo_base(data) ->Geo:
    c=(
        Geo()
        .add_schema(maptype="china")
        .add("2019国庆旅游热力图",data,ChartType.HEATMAP)
        .set_series_opts(label_opts=opts.LabelOpts(is_show=False))
        .set_global_opts(
            visualmap_opts=opts.VisualMapOpts(),
            title_opts=opts.TitleOpts(title="2019国庆旅游热力图"),
            )
        )
    return c

def provbar(place) ->Bar:
    place=np.array(place)
    foo=place[:,1].astype(np.float)
    order=np.argsort(foo)
    k=0
    place1=np.copy(place)
    for i in order:
        place1[k]=place[i,:]
        k=k+1
    place=place1
    bar = Bar()
    bar.add_xaxis(list(place[:,0]))
    bar.add_yaxis("热度",list(place[:,1]))
    bar.set_global_opts(title_opts=opts.TitleOpts(title="国庆旅游热度"))
    bar.set_global_opts(xaxis_opts=opts.AxisOpts(boundary_gap=1,interval=0,axislabel_opts={"rotate":45}),toolbox_opts = opts.ToolboxOpts(is_show = True),datazoom_opts= [opts.DataZoomOpts(range_start=0, range_end=100,is_zoom_lock=False)])
    #bar.set_global_opts(xaxis_opts=opts.AxisTickOpts(is_align_with_label=0))
    bar.set_series_opts(label_opts=opts.LabelOpts(font_size=9))
    bar.width=1200
    bar.render(path="国庆旅游热度.html")
    return True

def coincedence(place) ->Bar:
    place=np.array(place)
    foo=place[:,1].astype(np.float)
    order=np.argsort(foo)
    k=0
    place1=np.copy(place)
    for i in order:
        place1[k]=place[i,:]
        k=k+1
    place=place1
    bar = Bar()
    bar.add_xaxis(list(place[:,0]))
    bar.add_yaxis("热度",list(place[:,1]))
    bar.set_global_opts(title_opts=opts.TitleOpts(title="外来旅游人口相关度"))
    bar.set_global_opts(xaxis_opts=opts.AxisOpts(boundary_gap=1,interval=0,axislabel_opts={"rotate":45}),toolbox_opts = opts.ToolboxOpts(is_show = True),datazoom_opts= [opts.DataZoomOpts(range_start=0, range_end=100,is_zoom_lock=False)])
    #bar.set_global_opts(xaxis_opts=opts.AxisTickOpts(is_align_with_label=0))
    bar.set_series_opts(label_opts=opts.LabelOpts(font_size=9))
    bar.width=1200
    bar.render(path="外来旅游人口相关度.html")
    return True

def map_base(data) -> Map:
    data=np.array(data)
    foo=data[:,1].astype(np.float)

    c = (
        Map()
        .add("热度", [list(z) for z in zip(data[:,0], data[:,1])], "china")
        .set_global_opts(
            title_opts=opts.TitleOpts(title="省份活跃度"),
            visualmap_opts=opts.VisualMapOpts(max_=ceil(max(foo)), is_piecewise=True),
        )
    )
    c.render(path="省份活跃度.html")
    return True

def download_soup_waitting(url):
    try:
        response = requests.get(url, headers=HEADERS,proxies=get_random_ip(),allow_redirects=False,timeout=5) #allow_redirects=False,
#        print(response.status_code)
        print(response.text)
        if(response.status_code == 200):
            html = response.content
            html = html.decode('utf-8')
            soup = BeautifulSoup(html, 'html.parser')
            return soup
        elif(response.status_code == 302): 
            """
            输入验证码
            """
            print("抓取验证码")
            response = requests.get(url, headers=HEADERS,proxies=get_random_ip(),timeout=5)
            html = response.content
            html = html.decode('utf-8')
            soup =  BeautifulSoup(html, 'html.parser')
            search_img=soup.find('div', attrs={'id': 'captchaCon'})
            image=search_img.findAll('img', attrs={'class': 'mp-captchaimg'})
            url1=image[0]['src']
            response1 = requests.get(url1, headers=HEADERS,proxies=get_random_ip(),timeout=5)
            img_count=int(time.time())
            imgname = 'image/'+str(img_count)+'.jpg'
#            print('下载图片'+imgname)
            with open(imgname, 'wb') as fd:
                    fd.write(response1.content)
            return download_soup_waitting(url)
        else:
            sleep(2)
            print("等待下载中")
            print(url)
            return download_soup_waitting(url)
    except:
        print("fault")
        return ""


def getTypes():
    types = ["场馆","文化古迹", "自然风光", "公园", "古建筑", "寺庙", "遗址", "古镇", "陵墓陵园", "故居", "宗教"]
    citylist=["山东","江苏","上海","浙江","安徽","福建","江西","广东","广西","海南","河南","湖南","湖北","北京","天津","河北","山西","内蒙古","宁夏","青海","陕西","甘肃","新疆","四川","贵州","云南","重庆","西藏","辽宁","吉林","黑龙江","香港","澳门","台湾"]
    for type1 in types:
        # url="http://piao.qunar.com/ticket/list.htm?keyword=%E7%83%AD%E9%97%A8%E6%99%AF%E7%82%B9&region=%from=mpl_search_suggest&subject="+type1+"&page=1"
        for city in citylist:
            url = "http://piao.qunar.com/ticket/list.htm?keyword=" + parse.quote(type1) + "&region=" + parse.quote(city)
            print(type1,city)
            getType(type1, url)


def getType(type1, url):
    # 下载热点旅游数据
    soup = download_soup_waitting(url)
    # 旅游景点对应的列表元素
    search_list = soup.find('div', attrs={'id': 'search-list'})
    # 找到所有的旅游景点项目，并且对其进行遍历
    sight_items = search_list.findAll('div', attrs={'class': 'sight_item'})
    print(url)
    for sight_item in sight_items:
        name = sight_item['data-sight-name']
        districts = sight_item['data-districts']
        point = sight_item['data-point']
        address = sight_item['data-address']
        data_id = sight_item['data-id']
        level = sight_item.find('span', attrs={'class': 'level'})
        if level:
            level = level.text
        else:
            level = ""
        product_star_level = sight_item.find(
            'span', attrs={'class': 'product_star_level'})
        if product_star_level:
            product_star_level = product_star_level.text
        else:
            product_star_level = ""
        intro = sight_item.find('div', attrs={'class': 'intro'})
        if intro:
            intro = intro['title']
        else:
            intro = ""
        try:
            writer.writerow([districts.replace("\n", ""), name.replace("\n", ""), data_id.replace("\n", ""), type1.replace("\n", ""), level.replace(
                "\n", ""), product_star_level.replace("\n", ""), address.replace("\n", ""), intro.replace("\n", ""), point.replace("\n", "")])
        except:
            pass
    # 找到向下翻页的按钮，如果发现，往下翻页，继续下载翻页内容
    next = soup.find('a', attrs={'class': 'next'})
    if next:
        next_url = "http://piao.qunar.com" + next['href']
        getType(type1, next_url)


if __name__ == '__main__':  
    getTypes()
    data_clean()
    data1=load_file()
    province=load_province()
    pr=np.array(province)
    popu=pd.read_csv('population.csv',engine='python')
    for i in range(len(pr)):
        for j in range(len(popu)):
            if popu['province'][j]==pr[i][0]:
                pr[i][1]=float(pr[i][1])/float(popu['num'][j])
                break
    a=geo_base(data1)
    a.render(path='热力图.html')
    provbar(province)
    coincedence(pr)
    map_base(province)
