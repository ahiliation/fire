#! /bin/sh

iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -I INPUT 1 -p tcp  --dport 22 -j ACCEPT

iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT

iptables -I INPUT 1 -p tcp --dport 21 -j ACCEPT

iptables -P INPUT DROP
