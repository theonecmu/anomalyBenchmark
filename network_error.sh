#!/bin/bash

tc qdisc add dev eth0 root netem delay 25ms 23ms
sleep 60
tc qdisc del dev eth0 root netem

## echo "The number of seconds elapsed since 01/01/1970 is:
## > `date +%s`.
## > The current date and time of the system (starting network error) is:
## > `date`." > network_error.txt
# iptables -A INPUT -i eth0 -p tcp --destination-port 80 -m statistic --mode random --probability 0.30 -j DROP
# sleep 100
# iptables --flush
# sleep 100
# iptables -A OUTPUT -i eth0 -p tcp --source-port 80 -m statistic --mode random --probability 0.30 -j DROP
# sleep 100
# iptables --flush
# sleep 100

#iptables -A INPUT -i eth0 -p tcp --source-port 3306 -m statistic --mode random --probability 0.30 -j DROP
#iptables -A OUTPUT -o eth0 -p tcp --destination-port 3306 -m statistic --mode random --probability 0.30 -j DROP
#sleep 60
#iptables --flush
# sleep 100
