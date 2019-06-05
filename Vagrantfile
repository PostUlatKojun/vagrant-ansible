# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	config.vm.define :master_ansible_debian, autostart: false do |master_debian|

  	master_debian.vm.box = "debian/stretch64"
  	master_debian.vm.boot_timeout = 120
  	master_debian.vm.network "private_network", ip: "192.168.33.12" # "public_network", use_dhcp_assigned_default_route: true
    master_debian.vm.synced_folder "ansible/ansible/", "/home/vagrant/ansible/ansible"
  	master_debian.vm.synced_folder "ansible/playbooks/", "/home/vagrant/ansible/playbooks"
    master_debian.ssh.insert_key = false

    master_debian.vm.synced_folder ".", "/vagrant", type: "virtualbox" # only for Windows

  	master_debian.vm.provider "virtualbox" do |vmd|
    	vmd.name = "Vagrant ansible master debian" 
  	end

  	master_debian.vm.provision "file", source: ".ssh/.ssh_debian_ansible_master/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  	master_debian.vm.provision "file", source: ".ssh/.ssh_debian_ansible_master/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"

    master_debian.vm.provision "shell", inline: <<-SHELL
      chmod 600 /home/vagrant/.ssh/id_rsa
      chmod 600 /home/vagrant/.ssh/id_rsa.pub
    SHELL

  	master_debian.vm.provision "shell", path: 'provisions/provision_master.sh'
  end

  config.vm.define :master_ansible_ubuntu, autostart: false do |master_ubuntu|

	  master_ubuntu.vm.box = "ubuntu/bionic64"
	  master_ubuntu.vm.network "private_network", ip: "192.168.33.24"
	  master_ubuntu.vm.synced_folder "ansible/ansible/", "/home/vagrant/ansible/ansible"
	  master_ubuntu.vm.synced_folder "ansible/playbooks/", "/home/vagrant/ansible/playbooks"

	  config.vm.provider "virtualbox" do |vmu|
  	  vmu.name = "Vagrant ansible master ubuntu" 
      vmu.memory = "2048"
	  end
  
	  master_ubuntu.vm.provision "file", source: ".ssh/.ssh_ubuntu_ansible_master/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  	master_ubuntu.vm.provision "file", source: ".ssh/.ssh_ubuntu_ansible_master/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"

  	master_ubuntu.vm.provision "shell", path: 'provisions/provision_master.sh'

    master_ubuntu.vm.provision "shell", inline: <<-SHELL
      chmod 600 /home/vagrant/.ssh/id_rsa
      chmod 600 /home/vagrant/.ssh/id_rsa.pub
    SHELL

  end

  config.vm.define :slave_ansible_ubuntu, autostart: false do |slave_ubuntu|

  	slave_ubuntu.vm.box = "ubuntu/bionic64"
    # slave_ubuntu.vm.network "public_network", use_dhcp_assigned_default_route: true
  	slave_ubuntu.vm.network "private_network", ip: "192.168.33.112"
  	slave_ubuntu.vm.synced_folder "yandextank/", "/home/vagrant/yandextank"

  	slave_ubuntu.vm.provider "virtualbox" do |vsu|
    	vsu.name = "Vagrant ansible slave ubuntu"   
  	end
     
  	slave_ubuntu.vm.provision "shell", path: 'provisions/provision_slave.sh'
  end

  config.vm.define :slave_ansible_debian, autostart: false do |slave_debian|

  	slave_debian.vm.box = "debian/stretch64"
  	slave_debian.vm.boot_timeout = 120
    # slave_debian.vm.network "public_network", use_dhcp_assigned_default_route: true
  	slave_debian.vm.network "private_network", ip: "192.168.33.124"
    # config.vm.network "public_network", use_dhcp_assigned_default_route: true
    # slave_debian.vm.synced_folder "yandextank/backups/", "/var/lib/jenkins/backup", owner: "jenkins", group: "jenkins", mount_options: ["dmode=755", "fmode=644"]
  	# slave_debian.vm.synced_folder "yandextank/", "/home/vagrant/yandextank"
    slave_debian.ssh.insert_key = false
    # slave_debian.disksize.size = '60GB'

    slave_debian.vm.synced_folder ".", "/vagrant", type: "virtualbox" # only for Windows

  	slave_debian.vm.provider "virtualbox" do |vsd|
    	vsd.name = "Vagrant ansible slave debian"   
    	vsd.memory = "4096"
  	end

	  slave_debian.vm.provision "shell", path: 'provisions/provision_slave.sh'
	end

	config.vm.define :slave_ansible_centos, autostart: false do |slave_centos|

		slave_centos.vm.box = "centos/7"
  	slave_centos.vm.network "private_network", ip: "192.168.33.127" # config.vm.network "public_network", ip: "192.168.0.127"
  	slave_centos.ssh.insert_key = false

    slave_centos.vm.synced_folder ".", "/vagrant", type: "virtualbox" # only for Windows

  	slave_centos.vm.provider "virtualbox" do |vsc|
    	vsc.name = "Vagrant ansible slave centos7 64"   
  	end
  
	  slave_centos.vm.provision "shell", path: 'provisions/provision_slave.sh'
	end

end

