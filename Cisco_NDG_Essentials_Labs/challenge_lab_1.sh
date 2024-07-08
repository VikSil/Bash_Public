#!/bin/bash

DEPARTMENTS="engineering sales IS"

cd /

for dept in $DEPARTMENTS; do
    # delete 
    if [ $1 = "remove" ]; then
        for num in `seq 1 2`; do
            sudo rm -rf /home/$dept"_user_"$num 
            sudo userdel $dept"_user_"$num
        done
        sudo rm -rf /home/$dept"_admin" 
        sudo userdel $dept"_admin"
        sudo groupdel $dept
        sudo rm -rf $dept
    # create
    else 
        sudo mkdir $dept
        sudo groupadd $dept
        sudo useradd -m -G $dept -s /bin/bash $dept"_admin"
        for num in `seq 1 2`; do
            sudo useradd -G $dept -s /bin/bash $dept"_user_"$num
        done
        
        sudo chown $dept"_admin":$dept /$dept
        sudo chmod o=rwx /$dept
        sudo chmod g=rwx /$dept
        sudo chmod o-rwx /$dept
        sudo chmod +1000 /$dept
        
        echo "This file contains confidential information for the department." > /$dept/file.txt
        sudo chown $dept"_admin":$dept /$dept/file.txt
        sudo chmod 740 /$dept/file.txt
    fi
done

# verify
for dept in $DEPARTMENTS; do
    echo "DEPARTMENT: $dept"
    echo "Groups:"
    sudo grep $dept /etc/group
    echo "Users:"
    sudo grep $dept /etc/passwd
    echo "Folders:"
    sudo ls -lAh | grep $dept
    echo "Files:"
    sudo ls -lAh /$dept
    echo
done