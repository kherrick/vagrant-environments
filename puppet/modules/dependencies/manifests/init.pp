class dependencies {

    require system

    package { 'php5':
        ensure  => installed
    }

    package { 'php5-mcrypt':
        require => Package['php5'],
        ensure  => installed
    }

    exec { 'disable-apache2':
        require => Package['php5'],
        command => '/sbin/insserv -r apache2'
    }

}
