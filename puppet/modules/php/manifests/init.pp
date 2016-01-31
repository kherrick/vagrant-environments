class php {

    require system
    require apache
    require mysql
    require ppas

    package { 'libapache2-mod-php7.0':
        ensure => installed
    }

    package { 'php7.0':
        ensure => installed
    }

    package { 'php7.0-cli':
        ensure => installed
    }

    package { 'php7.0-common':
        ensure => installed
    }

    package { 'php7.0-gd':
        ensure => installed
    }

    package { 'php7.0-mysql':
        ensure => installed
    }

    file { '/opt/vagrant-provision/bin/post-php-install.sh':
        require => Package['php7.0'],
        source => 'puppet:///modules/php/post-php-install.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'post-php-install':
        require => File['/opt/vagrant-provision/bin/post-php-install.sh'],
        command => '/opt/vagrant-provision/bin/post-php-install.sh',
        creates => '/opt/vagrant-provision/.post-php-install'
    }

}
