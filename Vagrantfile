# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do | global |
  global.vbguest.auto_update = false
end

Vagrant.configure(2) do |config|
  config.vm.box = "landregistry/centos"
  config.vm.provision "shell", inline: <<-SCRIPT
    puppet module install puppetlabs-stdlib
    ln -s /vagrant /etc/puppet/modules/nagiosclient
    puppet apply /vagrant/tests/init.pp
  SCRIPT

  #config.vm.network "private_network", :ip => "192.168.42.49"

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', ENV['VM_MEMORY'] || 2048]
    vb.customize ["modifyvm", :id, "--cpus", ENV['VM_CPUS'] || 4]
  end
end
