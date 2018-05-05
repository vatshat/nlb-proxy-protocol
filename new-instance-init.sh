#!/bin/sh

yum install -y update
yum install -y epel-release
yum install -y docker
yum install -y python-pip
pip install docker-compose
yum upgrade -y python*

service docker start
usermod -a -G docker ec2-user

cd /home/ec2-user/
wget https://s3-eu-west-1.amazonaws.com/thabile-support/reverse-proxy.zip
unzip reverse-proxy.zip
chown -R ec2-user:ec2-user reverse-proxy
chown ec2-user:ec2-user reverse-proxy.zip

/usr/local/bin/docker-compose -f /home/ec2-user/reverse-proxy/docker-compose.yml build
/usr/local/bin/docker-compose -f /home/ec2-user/reverse-proxy/docker-compose.yml up