# calendar of a particular month
cal 10 2023

# week day name of today 
date +%A
#-------------------------------------------
# number lines (nl) of the output
ls | nl

#-------------------------------------------
sleep 60 # sleep for a minute

#-------------------------------------------
# Update VS Code
wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O /tmp/code_latest_amd64.deb
sudo dpkg -i /tmp/code_latest_amd64.deb