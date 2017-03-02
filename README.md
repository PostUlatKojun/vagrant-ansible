# vagrant-ansible
Develop &amp; test your Ansible playbooks with Vagrant

Версии:  

Debian: 3.16.0-4-amd64 #1 SMP Debian 3.16.39-1 (2016-12-30) x86_64 GNU/Linux  
Virtualbox: 5.1.14 r112924 (Qt5.3.2)  
Vagrant: 1.9.1  
vagrant box: ubuntu/trusty64 (virtualbox, 20170222.0.0)  
ansible: 2.2.1.0  

Устанавливалось на debian jessie  

###Установка virtualbox  
добавляем запись о новом репозитории  
`sudo nano /etc/apt/sources.list`  
добавить запись в конце файла  
`deb http://download.virtualbox.org/virtualbox/debian jessie contrib`  
скачиваем и добавляем ключ  
`wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -`  
и второй ключ  
`wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -`  
обновляем данные репозиториев  
`sudo apt-get update`  
устанавливаем virtualbox  
`sudo apt-get install virtualbox-5.1`  

[Оригинал мануала](https://www.virtualbox.org/wiki/Linux_Downloads)  

###Установка vagrant  
скачиваем версию vagrant  
`wget https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb`  
устанавливаем vagrant  
`sudo dpkg -i vagrant_1.9.1_x86_64.deb` 
устанавливаем плагин гостевой системы virtualbox  
`vagrant plugin install vagrant-vbguest`  
заходим в папку находится vagrant  
`cd Vagrant_ansible_master`  
 запускаем  
`vagrant up`  
логинимся в поднятую машину по ssh  
`vagrant ssh`  
