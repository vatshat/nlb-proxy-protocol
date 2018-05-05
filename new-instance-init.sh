#!/bin/sh

yum install -y update
yum install -y epel-release
yum install -y docker
yum install -y python-pip
pip install docker-compose
yum upgrade -y python*
yum install -y git

service docker start
usermod -a -G docker ec2-user

cd /home/ec2-user/
git clone https://github.com/vatshat/nlb-proxy-protocol.git
chown -R ec2-user:ec2-user reverse-proxy

/usr/local/bin/docker-compose -f /home/ec2-user/reverse-proxy/docker-compose.yml build
/usr/local/bin/docker-compose -f /home/ec2-user/reverse-proxy/docker-compose.yml up
