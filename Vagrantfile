# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.define "hadoop"
  config.vm.hostname = "hadoop"
  config.vm.box = "bento/centos-7.4"
  
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  
  # Hadopp web interface for the namenode
  config.vm.network "forwarded_port", guest: 9870, host: 9870

	# Hadoop HDFS NameNode
	config.vm.network "forwarded_port", guest: 8020, host: 8020
	
	# Hadoop HDFS over HTTP (HTTPFS)
	config.vm.network "forwarded_port", guest: 14000, host: 14000
	
	# Hadoop HDFS NameNode HTTP UI
	config.vm.network "forwarded_port", guest: 50070, host: 50070
	
	# Hadoop HDFS NameNode HTTPS UI
	config.vm.network "forwarded_port", guest: 50470, host: 50470
	
	# Hadoop HDFS HA JournalNode
	config.vm.network "forwarded_port", guest: 8485, host: 8485
	
	# Hadoop HDFS DataNode
	config.vm.network "forwarded_port", guest: 50010, host: 50010
	
	# Hadoop HDFS DataNode HTTP UI
	config.vm.network "forwarded_port", guest: 50075, host: 50075
	
	# Hadoop HDFS DataNode IPC
	config.vm.network "forwarded_port", guest: 50020, host: 50020
	
	# Hadoop YARN ResourceManager
	config.vm.network "forwarded_port", guest: 8032, host: 8032
	
	# Hadoop YARN ResourceManager Scheduler
	config.vm.network "forwarded_port", guest: 8030, host: 8030
	
	# Hadoop YARN ResourceManager Tracker
	config.vm.network "forwarded_port", guest: 8031, host: 8031
	
	# Hadoop YARN ResourceManager Admin
	config.vm.network "forwarded_port", guest: 8033, host: 8033
	
	# Hadoop YARN ResourceManager HTTP UI
	config.vm.network "forwarded_port", guest: 8088, host: 8088
	
	# Hadoop YARN NodeManager
	config.vm.network "forwarded_port", guest: 8041, host: 8041
	
	# Hadoop YARN NodeManager localizer
	config.vm.network "forwarded_port", guest: 8040, host: 8040
	
	# Hadoop YARN NodeManager HTTP UI
	config.vm.network "forwarded_port", guest: 8042, host: 8042
	
	# Spark Yarn Shuffle Service
	config.vm.network "forwarded_port", guest: 7337, host: 7337
	
	# Hadoop MapReduce JobHistory Server
	config.vm.network "forwarded_port", guest: 10020, host: 10020
	
	# Hadoop MapReduce Shuffle Port
	config.vm.network "forwarded_port", guest: 13562, host: 13562
	
	# Hadoop MapReduce JobHistory HTTP UI
	config.vm.network "forwarded_port", guest: 19888, host: 19888
	
	# Hive Server
	config.vm.network "forwarded_port", guest: 10000, host: 10000
	
	# Hive MetaStore
	config.vm.network "forwarded_port", guest: 9083, host: 9083
	
	# analytics-meta MySQL instance
	config.vm.network "forwarded_port", guest: 3306, host: 3306
	
	# Zookeeper (client port)
	config.vm.network "forwarded_port", guest: 2181, host: 2181
	
	# Hue Server
	config.vm.network "forwarded_port", guest: 8888, host: 8888
	
	# Oozie Server HTTP interface
	config.vm.network "forwarded_port", guest: 11000, host: 11000
	
	# Oozie Server Admin Port
	config.vm.network "forwarded_port", guest: 11001, host: 11001
	
	# Spark Local Client Driver HTTP UI
	config.vm.network "forwarded_port", guest: 4040, host: 4040
  

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end

  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     # vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
    vb.cpus = "2"
  end

  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end
  config.vm.provision :shell, path: "bootstrap.sh"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, hadoop, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
