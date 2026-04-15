#!/bin/bash

file=$1

if [[ -z $file ]]; then
    echo 'Error: empty file or no argument passed'
elif [[ ! -f $file ]]; then
    echo 'Error: file does not exit or not a regular file'
fi

groupadd business
groupadd finance
groupadd security

while IFS= read -r line; do
    IFS=':' read -ra keywords <<< $line
    user="${keywords[0]}"
    fname="${keywords[1]}"
    lname="${keywords[2]}"
    phone="${keywords[3]}"
    email="${keywords[4]}"
    dep="${keywords[5]}"
    pass="welcome"

    useradd -m $user
    echo "$user:$pass" | chpasswd
    usermod -c "$fname $lname $phone $email $user"
    usermod -aG "$dep" "$user"
done < "$file"