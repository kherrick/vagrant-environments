class ppas {

	require system

    package { 'software-properties-common':
        ensure => installed
    }

    package { 'python-software-properties':
        require => Package['software-properties-common'],
        ensure => installed
    }

    file { '/opt/vagrant-provision/bin/ppas-setup.sh':
        require => Package['python-software-properties'],
        source => 'puppet:///modules/ppas/ppas-setup.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'ppas-setup':
        require => File['/opt/vagrant-provision/bin/ppas-setup.sh'],
        command => '/opt/vagrant-provision/bin/ppas-setup.sh',
        creates => '/opt/vagrant-provision/.ppas-setup'
    }

    exec { 'apt-get-update-for-ppas':
        require => Exec['ppas-setup'],
        command => '/usr/bin/apt-get update'
    }

}
