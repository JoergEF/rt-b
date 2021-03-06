#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

# Konfiguration der Namensauflösung
systemctl disable --now systemd-resolved
rm /etc/resolv.conf
echo "nameserver 10.50.100.10" > /etc/resolv.conf
echo "nameserver 10.50.100.11" >> /etc/resolv.conf
echo "search training.erfurt.iad.de" >> /etc/resolv.conf
apt-get -y install dnsmasq

# Konfiguration von Firewall und NAT
apt-get -y install firehol
cp /vagrant/config/etc-firehol.conf /etc/firehol/firehol.conf
cp /vagrant/config/def-firehol /etc/default/firehol
firehol start
