# low level network config
iptables
# GUI network config
gufw

#-------------------------------------------
# ICMP PROTOCOL
cat /proc/sys/net/ipv4/icmp_echo_ignore_all # if 0 then ICMP requests are accepted
ping -c1 localhost # ping and stop after one return
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all # override to prohibit ICMP protocol
ping -c1 localhost # will now get no response


#-------------------------------------------
# ping 4 times
ping -c 4 example.com

# ping in the background (&) and redirect output to /dev/null (aka 'bit bucket')
ping localhost > /dev/null & # will return [JobID] PID

#-------------------------------------------
# DNS (aka nameserver)
cat /etc/resolv.conf # stores the local DNS IP address

# ask DNS for a hosts IP
host example.com # returns IPv4, IPv6, mailserver
host -a example.com # more detailed info
dig example.com

# ask DNS for hostname by IP
dig -x 123.456.789.0

# LAN IPs
cat /etc/hosts

# DNS lookup sequence
cat  /etc/nsswitch.conf | grep hosts
# files = /etc/hosts

#-------------------------------------------
# ROUTING

# show all gateways & routes
route
ip route
ip route show
netstat -r

#-------------------------------------------
# DEVICES
ifconfig # shows all network devices (including containerised)
ip addr show # shows all network devices

ifdown eth0 # shut down ethernet (e.g. to reconfigure)
ifup eth0 # start up ethernet

sudo ifconfig networkInterfaceName down
sudo ifconfig networkInterfaceName up

# load statistics on interfaces
netstat -i
ip -s link

# device groups
netstat -g
ip maddr

# local hostname
uname -n
uname --nodename

#-------------------------------------------
# PORTS
netstat -tln # view open/listening (-l) TCP (-t) ports as numbers (-n)
ss -a | grep LISTEN # list open sockets (ss = socket statistics)

#-------------------------------------------
# TRAFFIC
ss -s # amount of traffic through each kind of sockets

#-------------------------------------------
# AUTHORISATION
ssh username@host # send login request
exit # logout
# RSA keys for the known hosts should be here
cat ~/.ssh/known_hosts