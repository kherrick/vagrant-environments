class wordpress {

    require system
    require apache
    require mysql

    package { 'apache2-mpm-prefork':
        ensure => installed
    }

    package { 'fontconfig-config':
        ensure => installed
    }

    package { 'javascript-common':
        ensure => installed
    }

    package { 'libapache2-mod-php5':
        ensure => installed
    }

    package { 'libfontconfig1':
        ensure => installed
    }

    package { 'libgd2-xpm':
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

    package { 'libphp-phpmailer':
        ensure => installed
    }

    package { 'libphp-snoopy':
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

    package { 'php5':
        ensure => installed
    }

    package { 'php5-cli':
        ensure => installed
    }

    package { 'php5-common':
        ensure => installed
    }

    package { 'php5-gd':
        ensure => installed
    }

    package { 'php5-mysql':
        ensure => installed
    }

    package { 'tinymce':
        ensure => installed
    }

    package { 'ttf-dejavu-core':
        ensure => installed
    }

    package { 'wwwconfig-common':
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

    file { '/opt/vagrant-provision/bin/create-wp-config.sh':
        require => Exec['wordpress-intial-setup'],
        source => 'puppet:///modules/wordpress/create-wp-config.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0755
    }

    exec { 'create-wp-config':
        require => File['/opt/vagrant-provision/bin/create-wp-config.sh'],
        command => '/opt/vagrant-provision/bin/create-wp-config.sh',
        creates => '/opt/vagrant-provision/.create-wp-config'
    }

}

