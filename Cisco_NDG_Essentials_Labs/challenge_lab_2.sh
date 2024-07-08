#!/bin/bash

echo "Please input a unique group name:"
read groupname
getent group $groupname > /dev/null
while [ $? -eq 0 ]
    do
        echo "Error: Group name taken!\n"
        echo "Please enter a different group name:"
        read groupname                                 
        getent group $groupname > /dev/null                                   
    done  

echo "Please input a unique user name: "
read username
getent passwd $username > /dev/null
while [ $? -eq 0 ]
    do
        echo "Error: Username taken!\n"
        echo "Please enter a different user name:"
        read username                                 
        getent passwd $username > /dev/null                                   
    done

sudo groupadd $groupname
if [ $? -eq 0 ]; then
    sudo useradd -g $groupname -s /bin/bash $username
fi
if [ $? -eq 0 ]; then
    echo "The new user needs a password."
    sudo passwd $username
fi


sudo mkdir /$username
if [ $? -eq 0 ]; then
    sudo chown $username:$groupname /$username
    sudo chmod o=rwx /$username
    sudo chmod g=rwx /$groupname
    sudo chmod +1000 /$dept
    echo "Directory /$username created and permissions set."
fi