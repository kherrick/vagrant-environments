class mysql {

    require system

    file { '/opt/vagrant-provision/bin/mysql-root-password.sh':
        source => 'puppet:///modules/mysql/mysql-root-password.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'mysql-root-password':
        require => File['/opt/vagrant-provision/bin/mysql-root-password.sh'],
        command => '/opt/vagrant-provision/bin/mysql-root-password.sh',
        creates => '/opt/vagrant-provision/.mysql-root-password'
    }

    package { 'mysql-server':
        require => Exec['mysql-root-password'],
        ensure => installed
    }

}
