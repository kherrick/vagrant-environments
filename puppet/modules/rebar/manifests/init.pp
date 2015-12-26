class rebar {

    require system
    require erlang

    file { '/opt/vagrant-provision/bin/rebar.sh':
        source => 'puppet:///modules/rebar/rebar.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => '0755'
    }

    exec { 'rebar':
        require => File['/opt/vagrant-provision/bin/rebar.sh'],
        command => '/opt/vagrant-provision/bin/rebar.sh',
        creates => '/opt/vagrant-provision/.rebar',
        timeout => 3600
    }

}
