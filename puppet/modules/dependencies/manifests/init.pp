class dependencies {

    package { 'php5':
        ensure  => installed
    }

    package { 'php5-mcrypt':
        ensure  => installed
    }

    exec { 'disable-apache2':
        command => '/sbin/insserv -r apache2'
    }

    Package['php5']        -> Package['php5-mcrypt']
    Package['php5-mcrypt'] -> Exec['disable-apache2']

}
