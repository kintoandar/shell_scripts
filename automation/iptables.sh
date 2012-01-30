#!/bin/bash

##########################
# kintoandar.blogspot.com
##########################

#Checkpoint
echo ""

#############################################################################################################
# IP Variables 	                                                                                                                                 
#############################################################################################################
#Checkpoint
echo "IP"

#############################################################################################################
# Interface Variables                                                                                                                                      
#############################################################################################################
#Checkpoint
echo "INTERFACE"

ETH0=`ifconfig eth0 | grep 'inet addr' | cut -d : -f 2 | cut -d \  -f 1`/32
WLAN0=`ifconfig wlan0 | grep 'inet addr' | cut -d : -f 2 | cut -d \  -f 1`/32

#############################################################################################################
# IPTABLES rule set																	 
#############################################################################################################
#Checkpoint
echo "RULE SET"

iptables=/sbin/iptables

# Flush All
$iptables -F
$iptables -X
$iptables -t nat -F
$iptables -t nat -X
#$iptables -t mangle -F
#$iptables -t mangle -X

# Filter All
$iptables -F INPUT
$iptables -F FORWARD
$iptables -F OUTPUT

$iptables -P INPUT   DROP
$iptables -P FORWARD DROP
$iptables -P OUTPUT  DROP

# Connection Status
$iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Loopback
$iptables -A INPUT  -i lo -j ACCEPT
$iptables -A OUTPUT -o lo -j ACCEPT


#############################################################################################################
# INPUT
#############################################################################################################
#Checkpoint
echo "INPUT"

# SSH Access
#for ip in 192.168.0.1; do
#	$iptables -A INPUT -s $ip -p tcp -m tcp --dport 22 -j ACCEPT
#done

$iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

# ICMP
$iptables -A INPUT -p icmp -j ACCEPT

#############################################################################################################
# FOWARD
#############################################################################################################
#Checkpoint
echo "FOWARD"
#$iptables -A FORWARD -s 192.168.122.0/24 -j ACCEPT

#############################################################################################################
# OUTPUT
#############################################################################################################
#Checkpoint
echo "OUTPUT"

# ACCEPT ALL OUT
$iptables -A OUTPUT -j ACCEPT

#############################################################################################################
# MANGLE
#############################################################################################################
#Checkpoint
echo "MANGLE"

#############################################################################################################
# NAT
#############################################################################################################
#Checkpoint
echo "NAT"

# Global NAT
#$iptables -t nat -A POSTROUTING -s 192.168.1.0/255.255.255.0 ! -d 192.168.1.0/255.255.255.0 -o eth0 -j MASQUERADE

#############################################################################################################
# Logging                                                                                                                                   
#############################################################################################################
#Checkpoint
echo "LOG"

if [ $ETH0 != "/32" ]; then
	$iptables -A INPUT   -d $ETH0  -m limit --limit 100/min -j LOG --log-level 6 --log-prefix "DROP-INPUT "
fi

if [ $WLAN0 != "/32" ]; then
	$iptables -A INPUT   -d $WLAN0 -m limit --limit 100/min -j LOG --log-level 6 --log-prefix "DROP-INPUT "
fi

$iptables -A FORWARD -m limit --limit 100/min -j LOG --log-level 6 --log-prefix "DROP-FORWARD "
$iptables -A OUTPUT  -m limit --limit 100/min -j LOG --log-level 6 --log-prefix "DROP-OUTPUT "

#############################################################################################################
# Deploy Procedure                                                                                           
#############################################################################################################
#Checkpoint
echo "SAVE"

${iptables}-save > /etc/iptables/rules.v4

# FOWARDING
#echo 1 > /proc/sys/net/ipv4/ip_forward

#Checkpoint
#echo "SYNC WITH NODE2"
#scp /etc/iptables/rules.v4 node2:/etc/iptables/rules.v4
#scp /etc/sysconfig/iptables node2:/etc/sysconfig/

echo "--"
echo "Please restart iptables"
echo "--"
echo ""
