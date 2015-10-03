class php {

    require system

    package { 'php5':
        ensure => installed
    }

    exec { 'disable-apache2':
        require => Package['php5'],
        command => '/sbin/insserv -r apache2'
    }

    exec { 'stop-apache':
        require => Package['php5'],
        command => '/usr/sbin/service apache2 stop'
    }

    package { 'php5-fpm':
        ensure => installed
    }

}
