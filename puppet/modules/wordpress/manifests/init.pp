class wordpress {

    require system
    require apache
    require mysql
    require php

    package { 'fontconfig-config':
        ensure => installed
    }

    package { 'javascript-common':
        ensure => installed
    }

    package { 'libfontconfig1':
        ensure => installed
    }

    package { 'libgd2-xpm-dev':
        ensure => installed
    }

    package { 'libjpeg8':
        ensure => installed
    }

    package { 'libjs-cropper':
        ensure => installed
    }

    package { 'libjs-prototype':
        ensure => installed
    }

    package { 'libjs-scriptaculous':
        ensure => installed
    }

    package { 'libonig2':
        ensure => installed
    }

    package { 'libpng12-0':
        ensure => installed
    }

    package { 'libqdbm14':
        ensure => installed
    }

    package { 'libxpm4':
        ensure => installed
    }

    package { 'tinymce':
        ensure => installed
    }

    package { 'ttf-dejavu-core':
        ensure => installed
    }

    file { '/opt/vagrant-provision/bin/wordpress.sql':
        source => 'puppet:///modules/wordpress/wordpress.sql',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0644
    }

    file { '/opt/vagrant-provision/bin/wordpress-intial-setup.sh':
        require => File['/opt/vagrant-provision/bin/wordpress.sql'],
        source => 'puppet:///modules/wordpress/wordpress-intial-setup.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'wordpress-intial-setup':
        require => File['/opt/vagrant-provision/bin/wordpress-intial-setup.sh'],
        command => '/opt/vagrant-provision/bin/wordpress-intial-setup.sh',
        creates => '/opt/vagrant-provision/.wordpress-intial-setup'
    }

    file { '/var/www/html/wp-config.php':
        require => Exec['wordpress-intial-setup'],
        source => 'puppet:///modules/wordpress/wp-config.php',
        ensure => file,
        owner => 'vagrant',
        group => 'vagrant',
        mode => 0644
    }

}
