#! /bin/bash
username="User"
groupname="User"
password="Skills39"
count=100

for i in $(seq -w $count)
do
    useradd -g $groupname $username$i -s /bin/bash -m  
    echo -e $password\n$password | passwd $username$i
done

