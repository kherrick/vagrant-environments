class system {

    file { '/opt/vagrant-bootstrap':
        ensure => directory,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    file { '/opt/vagrant-bootstrap/bin':
        ensure => directory,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    file { '/opt/vagrant-bootstrap/bin/vagrant-user-setup.sh':
        source => 'puppet:///modules/system/vagrant-user-setup.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'vagrant-user-setup':
        command => '/opt/vagrant-bootstrap/bin/vagrant-user-setup.sh',
        creates => '/opt/vagrant-bootstrap/.vagrant-user-setup'
    }

    exec { 'apt-get-update':
        command => '/usr/bin/apt-get update'
    }

    package { 'git':
        ensure  => installed
    }

    Exec['apt-get-update']                                   -> Package['git']
    Package['git']                                           -> File['/opt/vagrant-bootstrap']
    File['/opt/vagrant-bootstrap']                           -> File['/opt/vagrant-bootstrap/bin']
    File['/opt/vagrant-bootstrap/bin']                       -> File['/opt/vagrant-bootstrap/bin/vagrant-user-setup.sh']
    File['/opt/vagrant-bootstrap/bin/vagrant-user-setup.sh'] -> Exec['vagrant-user-setup']

}
