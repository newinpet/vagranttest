#!/bin/bash
#
# 2018-07-10 P.L.K.Newing Initial version
#
# Script to configure HAProxy on a Vagrant VM
#
echo "Installing HAProxy"
#
# Use yum to install HAProxy
#
yum install -y haproxy
#
# Copy our HAProxy config file to the /etc/haproxy directory
#
cp /vagrant/haproxy.cfg /etc/haproxy/
#
# Configure HAProxy logging
#
cp /vagrant/haproxy.conf /etc/rsyslog.d/
#
# Restart the syslog service
#
service rsyslog restart
#
# Configure and start the HAProxy service
#
chkconfig haproxy on
service haproxy start
