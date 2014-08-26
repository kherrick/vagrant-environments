class erlang {

    require system

    package { 'lib64ncurses5-dev':
        ensure => installed
    }

    package { 'libssl-dev':
        ensure => installed
    }

    package { 'openjdk-7-jdk':
        ensure => installed
    }

    package { 'unixodbc-dev':
        ensure => installed
    }

    package { 'build-essential':
        ensure => installed
    }

    package { 'libwxgtk-media3.0-dev':
        ensure => installed
    }

    package { 'libglu1-mesa-dev':
        ensure => installed
    }

    package { 'xsltproc':
        ensure => installed
    }

    package { 'fop':
        ensure => installed
    }

    package { 'libxml2-utils':
        ensure => installed
    }

    package { 'autoconf':
        ensure => installed
    }

    file { '/opt/vagrant-provision/bin/erlang.sh':
        source => 'puppet:///modules/erlang/erlang.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'erlang':
        require => [
            Package['lib64ncurses5-dev'],
            Package['libssl-dev'],
            Package['openjdk-7-jdk'],
            Package['unixodbc-dev'],
            Package['build-essential'],
            Package['libwxgtk-media3.0-dev'],
            Package['libglu1-mesa-dev'],
            Package['xsltproc'],
            Package['fop'],
            Package['libxml2-utils'],
            Package['autoconf'],
            File['/opt/vagrant-provision/bin/erlang.sh'],
        ],
        command => '/opt/vagrant-provision/bin/erlang.sh',
        creates => '/opt/vagrant-provision/.erlang',
        timeout => 3600
    }
}
