class laravel {

    file { '/opt/vagrant-bootstrap/bin/laravel-init.sh':
        source => 'puppet:///modules/laravel/laravel-init.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'laravel-init':
        command => '/opt/vagrant-bootstrap/bin/laravel-init.sh',
        creates => '/opt/vagrant-bootstrap/.laravel-init'
    }

    file { '/opt/vagrant-bootstrap/bin/laravel-auto-start.sh':
        source => 'puppet:///modules/laravel/laravel-auto-start.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'laravel-auto-start':
        command => '/opt/vagrant-bootstrap/bin/laravel-auto-start.sh',
        creates => '/opt/vagrant-bootstrap/.laravel-auto-start'
    }

    File['/opt/vagrant-bootstrap/bin/laravel-init.sh']        -> Exec['laravel-init']
    Exec['laravel-init']                                      -> File ['/opt/vagrant-bootstrap/bin/laravel-auto-start.sh']
    File ['/opt/vagrant-bootstrap/bin/laravel-auto-start.sh'] -> Exec['laravel-auto-start']

}