# boot instructions
cat /proc/cmdline

# memory usage by kernel
cat /proc/meminfo

# modules loaded in kernel
cat /proc/modules

# kernel config
nano /etc/sysctl.conf # modify then reboot

# override kernel config at runtime!!!
sysctl

# maximum PID 
cat /proc/sys/kernel/pid_max # modify to increase number of allowed concurrent processes
# once the number is exceeded, kernel will wrap around and use available PIDs from the bottom of the range


#-------------------------------------------
# PROCESSES
pstree # process tree
ls -lah /proc # processes running when the command is executed 
# the whole /proc dir is stored in RAM and ceases to exist when the system is shut down

ps # processes that have been launched from the current terminal
ps --forest # same as above, but tree format
ps aux # all processes on the system
ps -ef # formatted list (-f) of all processes (-e = everything) on the system 
ps -u username # view processes that belong to the specified user
ps -e | grep -i keyword | less # case insensitively (-i) find specific processes amongst all running on the system and open in pager
ps -p 1 # show init details of the process by PID

cat /proc/$PID/cmdLine # contains the command line that was executed to start the process

somecommand & # run a process in the background
fg %1 # bring background JobId to foreground
Ctrl+Z # suspend a foreground process
bg %1 # send a foreground process to background and start executing
kill % # kill by JobId
killall somecommand # kill all processes of the same command
pkill -15 somecommand # kill all processes of the same command
kill -9 -1 # kill all processes this user has permission to kill

#-------------------------------------------
# TOP
top # dynamic view of currently running processes, roughly equivalent to process tab in Win Task Manager
H # while in top toggles tasks vs threads
h # view help
k # kill (provide PID, send signal 9 to force kill)
r # renice (provide niceness value between -20 and 19 with higher numbers being less priority)
# only root can prioritise up (provide lesser or negative number), anyone can prioritise down (provide higher positive number)

uptime # load averages are for last one, five, fifteen minutes as number of busy cores
cat /proc/loadavg # uptime and number of executing processes/total processes and last executing PID
#-------------------------------------------
# LOGGING

journalctl # display syslogs (all logs from everywhere combined in a chronological order)
dmesg # display kernel boottime logs 

#-------------------------------------------

jobs # display all jobs running in the background of current terminal
