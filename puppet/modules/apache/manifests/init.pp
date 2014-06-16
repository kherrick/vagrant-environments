class apache {

    require system

    package { 'apache2':
        ensure => installed
    }

}
