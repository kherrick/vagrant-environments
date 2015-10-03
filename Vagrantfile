# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.hostname = "silex-boilerplate"
  config.vm.box = "puppetlabs/debian-7.8-32-puppet-enterprise"
  config.vm.network :forwarded_port, guest: 80, host: 8088
  config.vm.box_check_update = false

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/"
    puppet.manifest_file  = "site.pp"
    puppet.module_path    = "puppet/modules/"
  end
end
