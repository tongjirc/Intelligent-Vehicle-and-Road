# coding=utf-8
# author = ChenZixuan
import sys
import json
import csv
import urllib
import urllib.request
import http.cookiejar
import time
import requests
import threading
import bs4
from urllib import parse
from fake_useragent import UserAgent
from bs4 import BeautifulSoup

KEY_NUM = "653a34bb7a0209ab74b8af53554f0e6b"
SHANGHAI_AD = "310000"
SHANGHAI = "021"
BEIJING_AD = "110000"
START_LON = str(116.372284)
START_LAT = str(39.907107)
END_LON = str(116.419748)
END_LAT = str(39.908357)
ROUTE = "东长安街"
# ua = UserAgent()
# headers = {'User-Agent':ua.random}

def gaodestate():
    parameters = {'key': KEY_NUM, 'name': ROUTE, 'adcode': BEIJING_AD}
    base = 'https://restapi.amap.com/v3/traffic/status/road?parameters'
    response = requests.get(base,parameters)
    answer = response.json()
    return answer

def gaoderoute():
    origin=START_LON + ',' + START_LAT
    destination=END_LON + ',' + END_LAT
    parameters = {'key': KEY_NUM,'origin': origin, 'destination': destination, 'adcode': BEIJING_AD}
    base = 'https://restapi.amap.com/v3/direction/driving?parameters'
    response = requests.get(base,parameters)
    answer = response.json()
    return answer

def listen_route():
    """
    listen the route duration
    """
    try:
        T=str(int(time.time()))
        count=0
        with open("timebj"+T+".csv","w",newline='') as csvfile:
        # csvfile=open("time"+str(int(time.time()))+".csv","w",newline='')
            writer = csv.writer(csvfile)
            writer.writerow(["time","duration","distance"])
            print('begin time!')
        while(1):
            now=time.time()
            count=count+1
            print('Time_Num',count)
            b=gaoderoute()
            if(b['status']=='1'):
                b1=b['route']['paths'][0]
                with open("timebj"+T+".csv","a",newline='') as csvfile:
                    writer = csv.writer(csvfile)
                    writer.writerows([[int(time.time()),b1['duration'],b1['distance']]])
            time.sleep(60-int(time.time()-now))
    except urllib.error.URLError as e:
        if hasattr(e.code):
            print(e.code)
        print(e.reason)

def listen_state():
    """
    listen the route state
    """
    try:

        T=str(int(time.time()))
        count=0
        with open("statebj"+T+".csv","w",newline='') as csvfile:
        # csvfile=open("state"+str(int(time.time()))+".csv","w",newline='')
            writer = csv.writer(csvfile)
            writer.writerow(["time","blocked","status","expedite","congested","unknown"])
            print('begin state!')
        while(1):
            now=time.time()
            count=count+1
            print('State_Num',count)
            a=gaodestate()
            # print('state=',a['status'])
            if(a['status']=='1'):
                a1=a['trafficinfo']['evaluation']
                with open("statebj"+T+".csv","a",newline='') as csvfile:
                    writer = csv.writer(csvfile)
                    writer.writerows([[int(time.time()),a1["blocked"],a1["status"],a1["expedite"],a1["congested"],a1["unknown"]]])
            time.sleep(60-int(time.time()-now))
    except urllib.error.URLError as e:
        if hasattr(e.code):
            print(e.code)
        print(e.reason)


if __name__ == "__main__":
    try:
        # Threading
        t1 = threading.Thread(target=listen_route)
        t2 = threading.Thread(target=listen_state)
        t1.start()
        t2.start()
        t1.join()
        t2.join()
    except e:
        pass
    finally:
        # roadside.Terminate()
        sys.exit(0)



# url = 'https://restapi.amap.com/v3/direction/driving?origin=' + START_LON + ',' + START_LAT + \
#     '&destination=' + END_LON + ',' + END_LAT + \
#     '&extensions=all&output=xml&' + KEY_NUM + '&output=json'
# print(url)
# # Referer=""
# header = {
#     "User-Agent": "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.117 Safari/537.36"}
# proxy = urllib.request.ProxyHandler({'http': '125.123.65.13:9999'})
# cjar = http.cookiejar.CookieJar()
# opener = urllib.request.build_opener(
#     proxy, urllib.request.HTTPHandler, urllib.request.HTTPCookieProcessor(cjar))
# urllib.request.install_opener(opener)
# req = urllib.request.Request(url, headers=header)
# data = urllib.request.urlopen(req).read()
# with open("./2.html", 'wb') as file:
#     file.write(data)
# data = data.decode('utf-8')
# print(len(data))
# result = json.loads(data)

