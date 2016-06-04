# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "2"
    vb.memory = "2048"
  end

  config.vm.hostname = "vm"
  config.vm.provision "shell", path: 'bin/bootstrap.sh'
  #config.vm.provision "shell", inline: "gem install kaigara", privileged: false

end

