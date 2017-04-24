#!/bin/sh
apt-get update
apt-get install -y python-pip python-software-properties software-properties-common python-jinja2 python-markupsafe yum
# pip install ansible
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt-get update
apt-get install -y ansible
cp -r /home/vagrant/ansible/ansible /etc/
