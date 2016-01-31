class apache {

    require system

    package { 'apache2':
        ensure => installed
    }

    package { 'apache2-mpm-prefork':
        ensure => installed
    }

    package { 'wwwconfig-common':
        ensure => installed
    }

    file { '/opt/vagrant-provision/bin/post-apache-install.sh':
        require => Package['apache2'],
        source => 'puppet:///modules/apache/post-apache-install.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'post-apache-install':
        require => File['/opt/vagrant-provision/bin/post-apache-install.sh'],
        command => '/opt/vagrant-provision/bin/post-apache-install.sh',
        creates => '/opt/vagrant-provision/.post-apache-install'
    }

}
