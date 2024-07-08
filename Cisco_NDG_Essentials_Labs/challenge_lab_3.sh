#!/bin/bash

currentuser=`whoami`

if [ ! -d /home/arch ]; then
    mkdir /home/$currentuser/arch
    chmod 740 /home/$currentuser/arch
fi

if [ ! -d ~/backup ]; then
    mkdir ~/backup
    chmod 740 ~/backup
fi

echo "Archiving log files:"
cd /var/log
sudo tar -cvf /home/$currentuser/arch/log.tar *.log

if [ $? -eq 0 ]; then
    echo
    echo "These log files have been archived:"
    tar -tf /home/$currentuser/arch/log.tar

    echo
    echo "Extracting archive to backup folder."
    cd ~/backup
    tar -xvf /home/$currentuser/arch/log.tar
fi

echo
echo "Content of the backup directory:"
ls