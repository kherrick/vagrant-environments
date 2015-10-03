class nginx {

    require system
    require php

    package { 'nginx':
        ensure => installed
    }

    file { '/etc/nginx/nginx.conf':
        require => Package['nginx'],
        source => 'puppet:///modules/nginx/nginx.conf',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0644
    }

    file { '/etc/nginx/fastcgi_params':
        require => Package['nginx'],
        source => 'puppet:///modules/nginx/fastcgi_params',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0644
    }

    file { '/etc/nginx/sites-enabled/default':
        require => File['/etc/nginx/fastcgi_params'],
        source => 'puppet:///modules/nginx/default',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0644
    }

    exec { 'start-nginx':
        require => File['/etc/nginx/sites-enabled/default'],
        command => '/usr/sbin/service nginx start'
    }

}
