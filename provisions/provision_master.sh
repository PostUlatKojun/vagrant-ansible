#!/bin/sh
apt-get update
apt-get install -y python-pip python-software-properties software-properties-common python-jinja2 python-markupsafe yum
pip install ansible==2.2.1.0