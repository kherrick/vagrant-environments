# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "erlang"
  config.vm.boot_timeout = 3600
  config.vm.box = "puppetlabs/ubuntu-14.04-32-puppet"
  config.vm.box_version = "1.0.1"

  config.vm.network :forwarded_port, guest: 80, host: 8888

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
