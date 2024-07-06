#!/bin/bash
: <<'OBJECTIVES'

    1) Create a directory at the root (/) of the file system for three departments: Engineering, Sales and IS. Each directory name should reflect the department name that will use the directory.

    2) Create a group for each department. This name should reflect the department name that the group will be assigned.

    3) Create an administrative user for each of the departments.
        * The user will have a Bash login shell.
        * The user will belong to the respective group for each department. This will need to be the user’s primary group.

    4) Create two additional users for each department.
        * The users will have a Bash login shell.
        * The users will belong to their respective group for each department. This will need to be the user’s primary group.

    5) For security reasons, the following modifications will need to be made to each of the departments' respective directories:
        * Ensure that the owner of each of the directories is the department administrator and the group ownership is the group for each department.
        * The department administrator will have full access to their respective department directories.
        * Ensure that only the owner of a file in the department’s directory can delete the file. The user will also have ownership of their respective department folders.
        * Normal users in each department will have full access (Read, Write and Execute) to their respective department folders.
        * The department folders will ONLY be accessible by users/administrators in each of the respective departments. Ensure that no one else will have permissions to the folders.

    6) Create a document in each of the department directories.
        * The ownerships on this file will be the same as the directory it is located in.
        * The document should contain only one line of text that states, “This file contains confidential information for the department.”
        * This file can be read by any user in the department, but can only be modified by the department administrator. No one else has permissions to this file.

OBJECTIVES

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