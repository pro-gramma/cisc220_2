#!bin/bash
#James Neverson 10193581
sudo iptables -D INPUT
sudo iptables -D FORWARD
sudo iptables -D OUTPUT
sudo iptables -A INPUT -p tcp -j DROP
sudo iptables -A INPUT -p tcp -s 130.15.0.0/16 -j ACCEPT
sudo iptables -A INPUT -p tcp -s 192.168.0.0/16 -j ACCEPT
sudo iptables -A INPUT -p tcp -s 172.16.0.0/16 -j ACCEPT
sudo iptables -A INPUT -p tcp -s 10.0.0.0/16 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A OUTPUT -j DROP
sudo iptables -A OUTPUT -s 130.15.0.0/16 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 3306
sudo iptables -A OUTPUT -p tcp -j DROP
