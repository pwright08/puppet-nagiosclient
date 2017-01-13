Vagrant.configure(2) do | global |
  global.vbguest.auto_update = false
end

Vagrant.configure(2) do |config|
  config.vm.box = "landregistry/centos"
  config.vm.provision "shell", inline: <<-SCRIPT
    puppet module install puppetlabs-stdlib
    cd /etc/puppet/modules
    ln -s /vagrant /etc/puppet/modules/nagiosclient
    puppet apply /vagrant/tests/init.pp
  SCRIPT

end
