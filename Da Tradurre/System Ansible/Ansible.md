# Ansible

https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Latest Releases Via Apt (Debian)

Debian users may leverage the same source as the Ubuntu PPA.

Add the following line to /etc/apt/sources.list:

 deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main

Then run these commands:
 
 $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
 $ sudo apt-get update
 $ sudo apt-get install ansible


 /etc/ansible

 hosts
 [webservers]
  H22
  H23


 in .ssh/config 
 Host H22
        HostName 192.168.0.22
        User root
 Host H23
        HostName 192.168.0.23
        User root

Primo Test
 ansible H22 -m ping
 H22 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
 }
