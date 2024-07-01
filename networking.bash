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

# ping in the background (&) and redirect output to bit bucket
ping localhost > /dev/null & # will return [JobID] PID
