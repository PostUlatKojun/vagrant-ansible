#!/bin/sh
if uname -n | grep stretch
then
	apt-get update
	apt-get install -y python-pip software-properties-common python-jinja2 python-markupsafe yum rsync dirmngr
	# pip install ansible
	echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
	apt-get update
	apt-get install -y ansible
	cp -r /home/vagrant/ansible/ansible /etc/
	echo "stretch"
elif uname -n | grep jessie
then
	apt-get update
	apt-get install -y python-pip python-software-properties software-properties-common python-jinja2 python-markupsafe yum rsync dirmngr
	# pip install ansible
	echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
	apt-get update
	apt-get install -y ansible
	cp -r /home/vagrant/ansible/ansible /etc/
	echo "jessie"
elif uname -n | grep ubuntu-bionic
then
	apt-get update
	apt-get install -y python-pip software-properties-common python-jinja2 python-markupsafe yum rsync dirmngr
	# pip install ansible
	sudo apt-add-repository --yes --update ppa:ansible/ansible
	apt-get update
	apt-get install -y ansible
	cp -r /home/vagrant/ansible/ansible /etc/
	echo "ubuntu-bionic"
	# install polemarch
	# apt-get install python-pip python-virtualenv python-dev gcc libffi-dev libkrb5-dev libffi6 libssl-dev libyaml-dev libsasl2-dev libldap2-dev sshpass git redis-server mariadb-server
	# virtualenv /home/vagrant/polemarch
	# cd /home/vagrant/polemarch
	# source /home/vagrant/polemarch/bin/activate
	# pip install -U polemarch
	# mysql <<QUERY_INPUT
	# SET @@global.innodb_large_prefix = 1;
	# create user db_user;
	# create database db_name default CHARACTER set utf8 default COLLATE utf8_general_ci;
	# grant all on db_name.* to 'db_user'@'localhost' identified by 'db_password';
# QUERY_INPUT
	# mkdir /etc/polemarch
	# cp /home/vagrant/ansible/polemarch/settings.ini /etc/polemarch/settings.ini
	# mkdir /var/log/polemarch
	# touch /var/log/polemarch/web.log
	# polemarchctl migrate
	# polemarchctl webserver
fi