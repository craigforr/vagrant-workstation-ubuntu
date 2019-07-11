# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox"

  # Development Workstation -----------------------------------
  config.vm.define "workstation", primary: true do |workstation|
    # Ubuntu 18.04.2 LTS (Bionic Beaver)
    # https://app.vagrantup.com/ubuntu/boxes/bionic64
    # http://cloud-images.ubuntu.com/bionic/
    workstation.vm.box = "ubuntu/bionic64"
    workstation.vm.hostname = 'workstation'
    workstation.vm.network :private_network, ip: "192.168.56.11"
    workstation.vm.provision "file", source: "#{ENV['VAGRANT_WORKSATION_ANSIBLE_VAULT_SECRET']}", destination: "/home/vagrant/.ansible/.vault_password"
    workstation.vm.provision "file", source: "#{ENV['VAGRANT_WORKSTATION_AZURE_CREDENTIALS']}", destination: "/home/vagrant/.azure/credentials"
    workstation.vm.provision "file", source: "#{ENV['VAGRANT_WORKSTATION_AZURE_DEVOPS_TOKEN']}", destination: "/home/vagrant/.azure/azure_devops_token"
    workstation.vm.provision "file", source: "files/.bash_aliases", destination: "/home/vagrant/.bash_aliases"
    workstation.vm.provision "file", source: "files/.vimrc", destination: "/home/vagrant/.vimrc"
    workstation.vm.provision "file", source: "files/azure_config.ini", destination: "/home/vagrant/.azure/config"
    workstation.vm.synced_folder "/code", "/home/vagrant/code"
    workstation.vm.provider :virtualbox do |v|
      v.gui = false
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "workstation"]
    end
    workstation.vm.provision "ansible_local" do |ansible|
      compatibility_mode = "2.0"
      ansible.playbook = "workstation.yml"
    end
  end
end
