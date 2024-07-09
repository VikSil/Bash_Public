#!/bin/bash

 cd


grep -Ev '^#|^$' /etc/services | 
cut -f1 | sort | uniq -u > uniqueservices.txt


if [ $? -eq 0 ]; then
    echo "Line count:"
    wc -l uniqueservices.txt
    echo 'Head:'
    head uniqueservices.txt
    echo 'Tail:'
    tail uniqueservices.txt
fi