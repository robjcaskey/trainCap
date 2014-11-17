#!/usr/bin/env bash
# install the basics on a fresh raspian install
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
cd
apt-get update
apt-get install python-pip python-dev git -y
pip install PyYAML jinja2 paramiko
git clone https://github.com/ansible/ansible.git
cd ansible
git submodule update --init --recursive
make install
mkdir /etc/ansible
echo [trainGui] >> /etc/ansible/hosts
echo localhost	ansible_connection=local >> /etc/ansible/hosts
cd
git clone https://github.com/robjcaskey/trainCap.git
ansible-galaxy install -r trainCap/provisioning/requirements.txt

