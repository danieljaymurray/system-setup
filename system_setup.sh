#!/bin/bash
#
# iptables
#
# Flush all current rules from iptables
#
 iptables -F
#
# Allow SSH connections on tcp port 22
# This is essential when working on remote servers via SSH to prevent locking yourself out of the system
#
 iptables -A INPUT -p tcp --dport 22 -j ACCEPT
 iptables -A INPUT -p tcp --dport 80 -j ACCEPT
 iptables -A INPUT -p tcp --dport 443 -j ACCEPT
#
# Set default policies for INPUT, FORWARD and OUTPUT chains
#
 iptables -P INPUT DROP
 iptables -P FORWARD DROP
 iptables -P OUTPUT ACCEPT
#
# Set access for localhost
#
 iptables -A INPUT -i lo -j ACCEPT
#
# Accept packets belonging to established and related connections
#
 iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#
# Save settings
#
 /sbin/service iptables save
#
# List rules
#
 iptables -L -v

#Install packages

yum -y install vim
yum -y install git
yum -y install httpd
yum -y install java
yum -y install epel-release
yum -y install nodejs
yum -y install npm

yum update -y
