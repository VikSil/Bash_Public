# shows information about the current users session
w
# IDLE - how long has the user has been idle for
# JCPU - total cpu time (by all processes) since login
# PCPU - total cpu time for the current process
# WHAT - currently running process

last # show log file with reboot times (from /var/log/wtmp)
lastb # show bad/failed logins
#-------------------------------------------

# show information about current user
whoami
who # active user(s) and login time (from /var/log/utmp)
id # user and group membership

#-------------------------------------------
# LOGGING
cat /var/log/auth.log # authentication log

#-------------------------------------------
# switch to root
su -
su - root
su -l
su --login

#-------------------------------------------
# USER MANAGEMENT

cat /etc/passwd # list of all users in the system
grep username /etc/passwd # check if user exists in the system
getent passwd username # get user's entry from /etc/passwd or network directory servers
# username:password:userid:groupid:comment:homedir:default_shell

sudo cat /etc/shadow #encrypted psw storage, where 
# sysadmin:$6$c75ekQWF$.GpiZpFnIXLzkALjDpZXmjxZcIll14OvL2mFSIfnc1aU2cQ/221QL5AX5RjKXpXPJRQ0uVN35TY3/..c7v0.n0:16874:5:30:7:60:15050::
# username:encrypted psw:days since Epoch (1970-01-01) when psw was last changed:minumum number of days between psw changes:number of days the psw is valid:days of warning prior to psw expiry:grace period after psw expiry:day since Epoch when the account will be locked out::


getent database # get info out of a conf file - see help for available DBs
# more user config
grep -Ev '^#|^$' /etc/login.defs # only non-blank, non-comment lines

id username # UID, GUI and secondary groups

# list defaults with which new users are added
useradd -D # from /etc/default/useradd

useradd -D -f 30 # change grace period to 30 days (works for other -opt as well)

# create a user "janedoe" in primary group (-g) Id 123 and sulementary group (-G) "sales"
# with home directory (-k) "/userhomebase" 
# with 7 day grace period (-f), and expiry (-e) on day 19977, whos default shell (-s) is in /bin/bash
useradd -g 123 -G sales -b /userhomebase -f 7 -e 19977 -s /bin/bash janedoe

# create user "homeful" with home dir, even if by default there should be none (-m)
# and copy files from skeleton dir (-k) /path/sourcedir into the home dir (requires -m)
useradd -mk /path/sourcedir homeful
# create user "homeless" without a home dir, even if by default there should be one
useradd -M homeless # by default /etc/skel will be used as skeleton directory
useradd -d /path/janedoe janedoe # specify full path to homedir for the new user

sudo passwd username # set or change user password
passwd # change current users password

# password aging management
change -M 60 username # change expiration period to 60 days

# modify user account
usermod [options] username # options similar to useradd, see --help
usermod -L username # lock user
usermod -U username # unlock user
passwd -S username # see if the user is locked
usermod -g switchgroupname username # change users primary group

userdel -r username # recursively delete user, their home and mail


#-------------------------------------------
# GROUP MANAGEMENT

cat /etc/group # list all groups on the system
grep groupname /etc/group # display group info
getent group groupname # display group info over network

id -g # current user's primary group
groups # all current user's groups
newgrp switchgroupname # switch current session(!!) to a different primary group

groupadd -g 1005 research # add a new group with group id 1005 and name "research"
group -r sytemgroupname # add a group in the range reserved for system accounts (<1000 on Debian)
# with -r the system will choose the highest GID available (e.g. 999)

groupmod [options] groupname # modify a group, see --help
groupdel groupname # delete a group

# find all orphaned files (that don't belong any group/only know groupID of non-existent group)
find / -nogroup

