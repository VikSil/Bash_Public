# processor type (x86 or x64)
arch
# cpu details
lscpu
cat /proc/cpudetails
cat /proc/cpuinfo

# memory usage (in bytes, -m in MB, -g in GB)
free
free -ms 10 # memory usage in round megabytes updated every ten seconds
cat /proc/meminfo

# modules (drivers) currently loaded into the memory
lsmod

# devices on PCI (Peripheral Component Interconnect) bus
lspci
# devices on USB (Universal Serial Bus)
lsusb


# disk partitions
sudo parted -l
sudo fdisk -l
ls -lah /dev/[sh]d*
sudo cfdisk
sudo sfdisk -l

# device info 
ls -lAh /sys/devices # and drill in
ls -lAh /dev # currently running devices


