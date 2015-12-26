class elixir {

    require system
    require erlang

    file { '/opt/vagrant-provision/bin/elixir.sh':
        source => 'puppet:///modules/elixir/elixir.sh',
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => '0755'
    }

    exec { 'elixir':
        require => File['/opt/vagrant-provision/bin/elixir.sh'],
        command => '/opt/vagrant-provision/bin/elixir.sh',
        creates => '/opt/vagrant-provision/.elixir',
        timeout => 3600
    }
}
