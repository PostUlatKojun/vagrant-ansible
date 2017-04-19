# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	config.vm.define :master_ansible_debian, autostart: false do |master_debian|

  	master_debian.vm.box = "debian/jessie64"
  	master_debian.vm.boot_timeout = 120
  	master_debian.vm.network "private_network", ip: "192.168.33.12"
  	master_debian.vm.synced_folder "ansible/ansible/", "/etc/ansible"
  	master_debian.vm.synced_folder "ansible/playbooks/", "/home/vagrant/ansible/playbooks"

  	master_debian.vm.provider "virtualbox" do |vmd|
    	vmd.name = "Vagrant ansible master debian" 
  	end

  	master_debian.vm.provision "file", source: ".ssh/.ssh_debian_ansible_master/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  	master_debian.vm.provision "file", source: ".ssh/.ssh_debian_ansible_master/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"

  	master_debian.vm.provision "shell", inline: <<-SHELL
    	echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgLwj3Jq5QAmZX7B/8Of6y+2wt485hiThkrJ34OBmSg/2N4AvjP+Hlo/edwFRryD1mtFT2mPrilqQ2ElJKoIgzDYsx3izzkLNAK5ii0JLVZjmZeyHueQMwzxz80cwVjpn8kPqGYw3y4JVBhFljcbhFprqGJgogyHMq5t6spGv9k3QGbqRTgAGmoKvhcCCfUHtLJHDc/++uMuknjuA7Kvb4zby7ZDMYbYF27AJMBK6Tvi2DJsFepm8BnGIcywA0EQ3ym5NeEU6TNgXmRiFyEoQDc16cihW25K5Y0Ab2M/tnoHw+x9CrUhMr6CR+cTq6OIaY1fLdqyI/HBCLQUvcccwuQ== rsa-key-20160609" >> /home/vagrant/.ssh/authorized_keys
  	SHELL

  	master_debian.vm.provision "shell", path: 'provisions/provision_master.sh'
  end

  config.vm.define :master_ansible_ubuntu, autostart: false do |master_ubuntu|

	  master_ubuntu.vm.box = "ubuntu/trusty64"
	  master_ubuntu.vm.network "private_network", ip: "192.168.33.12"
	  master_ubuntu.vm.synced_folder "ansible/ansible/", "/etc/ansible"
	  master_ubuntu.vm.synced_folder "ansible/playbooks/", "/home/vagrant/ansible/playbooks"

	  config.vm.provider "virtualbox" do |vmu|
  	  vmu.name = "Vagrant ansible master ubuntu" 
	  end
  
	  master_ubuntu.vm.provision "file", source: ".ssh/.ssh_ubuntu_ansible_master/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  	master_ubuntu.vm.provision "file", source: ".ssh/.ssh_ubuntu_ansible_master/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"

  	master_ubuntu.vm.provision "shell", path: 'provisions/provision_master.sh'
  end

  config.vm.define :slave_ansible_ubuntu, autostart: false do |slave_ubuntu|

  	slave_ubuntu.vm.box = "ubuntu/trusty64"
  	slave_ubuntu.vm.network "private_network", ip: "192.168.33.112"
  	slave_ubuntu.vm.synced_folder "yandextank/", "/home/vagrant/yandextank"

  	slave_ubuntu.vm.provider "virtualbox" do |vsu|
    	vsu.name = "Vagrant ansible slave ubuntu"   
  	end
     
  	slave_ubuntu.vm.provision "shell", path: 'provisions/provision_slave.sh'
  end

  config.vm.define :slave_ansible_debian, autostart: false do |slave_debian|

  	slave_debian.vm.box = "debian/jessie64"
  	slave_debian.vm.boot_timeout = 120
  	slave_debian.vm.network "private_network", ip: "192.168.33.124"
  	slave_debian.vm.synced_folder "yandextank/", "/home/vagrant/yandextank"

  	slave_debian.vm.provider "virtualbox" do |vsd|
    	vsd.name = "Vagrant ansible slave debian"   
    	vsd.memory = "1024"
  	end

	  slave_debian.vm.provision "shell", path: 'provisions/provision_slave.sh'
	end

	config.vm.define :slave_ansible_centos, autostart: false do |slave_centos|

		slave_centos.vm.box = "centos/7"
  	slave_centos.vm.network "private_network", ip: "192.168.33.127" # config.vm.network "public_network", ip: "192.168.0.127"
  	slave_centos.ssh.insert_key = false

  	slave_centos.vm.provider "virtualbox" do |vsc|
    	vsc.name = "Vagrant ansible slave centos7 64"   
  	end
  
	  slave_centos.vm.provision "shell", path: 'provisions/provision_slave.sh'
	end

end

