# BLACK SCREEN after boot

# Press Ctrl + Alt +F2 to bring up console

startx # will start GUI or give errors to troubleshoot
# delete files:
sudo rm /home/<user>/.Xauthority-n
sudo rm /home/<user>/.Xauthority


# if xstart complains about it, check that the Xauth log file exists
# make sure that the disk is not full - try touching a file, it will tell you