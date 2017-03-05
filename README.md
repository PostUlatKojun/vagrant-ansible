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
Ввести в консоли  
`sudo nano /etc/apt/sources.list`  
Вставить строку в конце текста  
`deb http://download.virtualbox.org/virtualbox/debian jessie contrib`  
сохранить изменения комбинацией `Ctrl+O`, нажать Enter, выйти из редактора комбинацией `Ctrl+x` 
Далее в консоли ввести для скачивания и добавления ключа  
`wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -`  
и вторую строку
`wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -`  
следующей командой обновить репозиторий   
`sudo apt-get update`  
и устанавливить virtualbox  
`sudo apt-get -y install virtualbox-5.1`  

[Оригинал мануала](https://www.virtualbox.org/wiki/Linux_Downloads)  

###Установка vagrant  
Скачать vagrant  
`wget https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb`  
и устанавливаем его  
`sudo dpkg -i vagrant_1.9.1_x86_64.deb` 
слудующая команда устанавливает плагин гостевой системы virtualbox  
`vagrant plugin install vagrant-vbguest`  

###Установка git и клонирование репозитория
Устанавливаем git
`sudo apt-get -y install git`
Создаем папку для хранения репозитория и заходим в нее
`mkdir vagrant-ansible && cd vagrant ansible`

заходим в папку находится vagrant  
`cd Vagrant_ansible_master`  
 запускаем  
`vagrant up`  
логинимся в поднятую машину по ssh  
`vagrant ssh`  
