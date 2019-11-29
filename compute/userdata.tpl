#!/bin/bash
yum update
yum install -y httpd
echo "subnet for firewall: ${firewall_subnets}" >> /var/www/html/index.html
service https start

