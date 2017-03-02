# vagrant-ansible
Develop &amp; test your Ansible playbooks with Vagrant

Версии

Debian: 3.16.0-4-amd64 #1 SMP Debian 3.16.39-1 (2016-12-30) x86_64 GNU/Linux
Virtualbox: 5.1.14 r112924 (Qt5.3.2)
Vagrant: 1.9.1
vagrant box: ubuntu/trusty64 (virtualbox, 20170222.0.0)
ansible: 2.2.1.0

Устанавливалось на debian jessie

Установка virtualbox  
`sudo nano /etc/apt/sources.list` *#добавляем запись о новом репозитории*
`deb http://download.virtualbox.org/virtualbox/debian jessie contrib` *#добавить запись в конце файла*  
`wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -` *#скачиваем и добавляем ключ*    
`wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -` *#и второй ключ*  
`sudo apt-get update` *#обновляем данные репозиториев*  
`sudo apt-get install virtualbox-5.1` *#устанавливаем virtualbox*  

[Оригинал мануала](https://www.virtualbox.org/wiki/Linux_Downloads)

Установка vagrant
`wget https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb` скачиваем версию vagrant  
`sudo dpkg -i vagrant_1.9.1_x86_64.deb` устанавливаем vagrant  
`vagrant plugin install vagrant-vbguest` или `vagrant plugin repair` устанавливаем плагин гостевой системы virtualbox  

`cd Vagrant_ansible_master` заходим в папку находится vagrant  
`vagrant up` запускаем  
`vagrant ssh` логинимся в поднятую машину по ssh