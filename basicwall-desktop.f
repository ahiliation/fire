#! /bin/sh
# firewall script 


iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP


#iptables -A INPUT -s "69.171.229.11" -j DROP
#iptables -A INPUT -s "66.220.149.11" -j DROP


#iptables -A INPUT -s  "69.171.229.11" -j DROP
#iptables -A OUTPUT -d "69.171.229.11" -j DROP

#iptables -A INPUT -s  "66.220.149.11" -j DROP
#iptables -A OUTPUT -d "66.220.149.11" -j DROP



#iptables -A INPUT -m string --string 'facebook' --algo bm -j DROP


iptables -A OUTPUT -o eth0 -p tcp --sport 1024:65535 --dport 1024:65535 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -i eth0 -p tcp --sport 1024:65535 --dport 1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT




iptables -A OUTPUT -o eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

iptables -A OUTPUT -o eth0 -p tcp --dport 21 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 21 -m state --state ESTABLISHED -j ACCEPT

iptables -A OUTPUT -o eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

iptables -A OUTPUT -o eth0 -p tcp --dport 2082 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 2082 -m state --state ESTABLISHED -j ACCEPT

iptables -A OUTPUT -o eth0 -p tcp --dport 465 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 465 -m state --state NEW,ESTABLISHED -j ACCEPT






iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT

iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A OUTPUT -p udp -o eth0 --dport 53 -j ACCEPT
iptables -A INPUT -p udp -i eth0 --sport 53 -j ACCEPT
