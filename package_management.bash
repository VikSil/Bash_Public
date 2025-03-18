# Debian low level package manager
dpkg --help
# show all installed packageswith keyword in name
dpkg --list | grep keyword 
# Debian high level package managers
apt
apt-get
apt-cache
# Standard package manager
rpm
# GUI package manager
aptitude
#-------------------------------------------
# MANAGING PACKAGES
apt purge --auto-remove packagename # uninstall
# repositories are here - you can try removing any that are causing trouble
# /etc/apt/sources.list.d/
#-------------------------------------------
# SEARCHING FOR PACKAGES
apt-cache search keyword_in_package_name
# get more detailes info about a package
apt-cache show package_name
apt-cache showpkg package_name
#-------------------------------------------
# REPOs
#
# The repos that apt/apt-get cheks are listed here:
/etc/apt/sources.list.d
# removing a .list file will result in apt skipping the repo
