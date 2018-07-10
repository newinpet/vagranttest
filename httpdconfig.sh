#!/bin/bash
#
# 2018-07-10 P.L.K.Newing Initial version
#
# Script to configure Apache on a Vagrant VM
#
echo "Installing Apache"
#
# Use yum to install Apache
#
yum install -y httpd
#
# Copy our dummy index file to the Document root
#
cp /vagrant/index.html /var/www/html/
#
# Start Apache
#
service httpd start
