# vagrant-ansible
Develop &amp; test your Ansible playbooks with Vagrant

Версии:  

Debian: 3.16.0-4-amd64 #1 SMP Debian 3.16.39-1 (2016-12-30) x86_64 GNU/Linux  
Virtualbox: 5.1.18  
Vagrant: 1.9.3  
vagrant box: ubuntu/trusty64 (virtualbox, 20170222.0.0)  
ansible: 2.3.0.0  
apache-ant: 1.9.9  
apache-maven: 3.3.9  
gradle: 3.4  
elasticsearch: 5.2.2  
kibana: 5.2.2  
yandex-tank: 1.7.4

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
Клонируем репозиторий  
`git clone https://github.com/PostUlatKojun/vagrant-ansible.git`  

###Запуск vagrant  
Заходим в папку со скачанным репозиторием в папку Vagrant_ansible_slave  
`cd vagrant-ansible\Vagrant_ansible_slave`  
Запускаем виртуальную машину  
`vagrant up`  
Первый запуск займет некоторое время, т.к. будет скачиваться образ системы, с которой в дальнейшем будем работать. Сейчас происходит развертывание системы, на которой в дальнейшем будет установлен софт с помошью ansible  
Теперь заходим в папку, где будет установлен ansible  
`cd .. && cd Vagrant_ansible_master`  
включаем систему  
`vagrant up`  
подсоединяемся к влюченной системе по ssh  
`vagrant shh`  
После подключения приглашение в консоли должно смениться на "vagrant@vagrant-ubuntu-trusty-64"  

###Подготовка ansible  
Сгенерируем ssh ключ  
`ssh-keygen`  
Для завершения три раза нажать Enter  
Теперь скопируем ключ на вторую, уже запущенную систему  
`ssh-copy-id vagrant@192.168.33.112`  
Система задаст вопрос "хотите ли вы скопировать ssh ключ" нужно набрать "yes" и нажать Enter  
Следующий шаг ввод пароля, нужно ввести "vagrant"  
Для проверки, что все прошло успешно нужно ввести  
`ansible test -m ping`  
Появившийся зеленый текст означает что все прошло успешно  

###Установка программ  
####Установка java  
`ansible-playbook ansible/playbooks/java/java9/java9x32_x64_deb.yml`  
Следующей командой проверим что java установилась  
`ansible test -a "/usr/bin/java -version"`  
В выводе будет строка "java version "9-ea"" - значит java установилась правильно  

####Установка apache-ant  
`ansible-playbook ansible/playbooks/ant/ant.yml`  
Проверить установку можно командой  
`ansible test -a "/home/vagrant/apache-ant-1.9.9/bin/ant -version"`  

####Установка apache-maven  
`ansible-playbook ansible/playbooks/maven/maven.yml`  
Проверка установки командой  
`ansible test -a "/home/vagrant/apache-maven-3.3.9/bin/mvn -version"`  

####Установка gradle  
`ansible-playbook ansible/playbooks/gradle/gradle.yml`  
Проверка установки  
`ansible test -a "/home/vagrant/gradle-3.4/bin/gradle -version"`  

####Установка elasticsearch  
`ansible-playbook ansible/playbooks/elasticsearch/elasticsearch.yml`  
Для проверки стоит открыть браузер и набрать в адресной строке  
`192.168.33.112:9200`  
Должен загругиться текст, что будет означать о успешной установке и том что elfsticsearch запущен  

####Установка kibana  
`ansible-playbook ansible/playbooks/kibana/kibana.yml`  
Для проверки стоит открыть браузер и набрать в адресной строке  
'192.168.33.112:5601'  
Появится логотип kibana с последующим переходом в веь интерфейс  

####Установка yandex-tank  
`ansible-playbook ansible/playbooks/yandex-tank/yandex-tank.yml`  
Для проверки стоит выйти из текущей системы набрав команду  
`exit`  
Теперь стоит сменить папку и войти в систему с установленными программами  
`cd .. && cd Vagrant_ansible_slave`  
Подключаемся  
`vagrant ssh`  
Для проверки работоспособности набрать команду  
`yandex-tank -c yandextank/load.ini`  
После этого танк начнет в течении 1 минуты проводить нагрузочное тестирование google.com :-)  

####Еще немного ant, mvn и gradle  
После подлючения к Vagrant_ansible_slave  
* apache-ant будет доступен по комманде "ant" в консоли или по пути  
`/home/vagrant/apache-ant-1.9.9/bin/ant`  
* apache-maven - по команде "mvn" или по пути  
`/home/vagrant/apache-maven-3.3.9/bin/mvn`  
* gradle доступен по команду "gradle" или по пути  
`/home/vagrant/gradle-3.4/bin/gradle`  
