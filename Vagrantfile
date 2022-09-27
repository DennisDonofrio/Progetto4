# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  BOX_IMAGE = "ubuntu/jammy64"
  
  BASE_NETWORK = "10.10.20"
  PROXY_ENABLE = false
  PROXY_HTTP = "http://10.0.2.2:5865"
  PROXY_HTTPS = "http://10.0.2.2:5865"
  PROXY_EXCLUDE = "localhost,127.0.0.1"
  BOX_CHK_UPDATE = false
  SSH_INSERT_KEY = true
  VB_CHK_UPDATE = false
  if Vagrant.has_plugin?("vagrant-proxyconf")
    PROXY_ENABLE = true
  else
    PROXY_ENABLE = false
  end

  # Configurazione della macchina web
  config.vm.define "web" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
	subconfig.vm.network "private_network", ip: "#{BASE_NETWORK}.10", virtualbox__intnet: true
    subconfig.vm.network "forwarded_port", guest: 80, host: 9081
	
	if PROXY_ENABLE == true
      #only use with plugin vagrant-proxy
      #print "setting proxy config"
      subconfig.proxy.http = PROXY_HTTP
      subconfig.proxy.https = PROXY_HTTPS
      subconfig.proxy.no_proxy = PROXY_EXCLUDE
    end
	
    if Vagrant.has_plugin?("vagrant-vbguest")
      subconfig.vbguest.auto_update = VB_CHK_UPDATE
    end
	
	subconfig.vm.hostname = "mmweb.cpt.local"
	subconfig.vm.box_check_update = BOX_CHK_UPDATE

	subconfig.ssh.insert_key = SSH_INSERT_KEY
	
	subconfig.vm.provision "shell", path: "scripts/web.sh"
	
	# other config here
	subconfig.vm.synced_folder "var/www/", "/var/www/"
	
	subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "MMWeb"
      vb.memory = "2048"
      vb.cpus = 2
	end
  end
   
  # Configurazione della macchina db
  config.vm.define "db" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.network "private_network", ip: "#{BASE_NETWORK}.15", virtualbox__intnet: true
	
    if PROXY_ENABLE == true
      #only use with plugin vagrant-proxy
      #print "setting proxy config"
      subconfig.proxy.http = PROXY_HTTP
      subconfig.proxy.https = PROXY_HTTPS
      subconfig.proxy.no_proxy = PROXY_EXCLUDE
    end
	
    if Vagrant.has_plugin?("vagrant-vbguest")
      subconfig.vbguest.auto_update = VB_CHK_UPDATE
    end
	
	subconfig.vm.hostname = "mmdb.cpt.local"
	subconfig.vm.box_check_update = BOX_CHK_UPDATE

	subconfig.ssh.insert_key = SSH_INSERT_KEY
	
	subconfig.vm.provision "shell", path: "scripts/db.sh"
	
	subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "MMDb"
      vb.memory = "2048"
      vb.cpus = 2
    end
  end
end
