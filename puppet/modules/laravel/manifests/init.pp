class laravel {

    require system
    require dependencies

    file { '/opt/vagrant-provision/bin/laravel-init.sh':
        source => 'puppet:///modules/laravel/laravel-init.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'laravel-init':
        require => File['/opt/vagrant-provision/bin/laravel-init.sh'],
        command => '/opt/vagrant-provision/bin/laravel-init.sh',
        creates => '/opt/vagrant-provision/.laravel-init'
    }

    file { '/opt/vagrant-provision/bin/laravel-auto-start.sh':
        require => Exec['laravel-init'],
        source => 'puppet:///modules/laravel/laravel-auto-start.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'laravel-auto-start':
        require => File ['/opt/vagrant-provision/bin/laravel-auto-start.sh'],
        command => '/opt/vagrant-provision/bin/laravel-auto-start.sh',
        creates => '/opt/vagrant-provision/.laravel-auto-start'
    }

}
