class xinit {

    require system

    package { 'xinit':
        ensure => installed
    }

    file { '/root/.setup/':
        ensure => directory,
        mode   => 0644,
    }

    file { '/root/.setup/xinit/':
        ensure => directory,
        mode   => 0644,
    }

    file { '/root/.setup/xinit/autostart.sh':
        ensure  => file,
        mode    => 0755,
        source  => 'puppet:///modules/xinit/autostart.sh'
    }

    exec { 'autostart.sh':
        cwd     => '/root/.setup/xinit/',
        command => '/root/.setup/xinit/autostart.sh',
        creates => '/root/.setup/xinit/.autostart.sh'
    }

    Package['xinit']                        -> File['/root/.setup/']
    File['/root/.setup/']                   -> File['/root/.setup/xinit/']
    File['/root/.setup/xinit/']             -> File['/root/.setup/xinit/autostart.sh']
    File['/root/.setup/xinit/autostart.sh'] -> Exec['autostart.sh']

}
