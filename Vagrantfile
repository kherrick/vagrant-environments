# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "erlang"
  config.vm.boot_timeout = 3600
  config.vm.box = "debian-73-i386-virtualbox-puppet"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-73-i386-virtualbox-puppet.box"

  config.vm.network :forwarded_port, guest: 8082, host: 8082

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1536"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/"
    puppet.manifest_file  = "site.pp"
    puppet.module_path    = "puppet/modules/"
    # puppet.options        = "--verbose --debug"
  end

end
