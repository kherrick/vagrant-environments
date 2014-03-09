class firstboot {

    require xinit
    require pioneers

    file {'/root/.setup/firstboot/':
        ensure => directory,
        mode   => 0644,
    }

    file {'/root/.setup/firstboot/reboot.sh':
        ensure  => file,
        mode    => 0755,
        source  => 'puppet:///modules/firstboot/reboot.sh'
    }

    exec {'reboot.sh':
        cwd     => '/root/.setup/firstboot/',
        command => '/root/.setup/firstboot/reboot.sh',
        creates => '/root/.setup/firstboot/.reboot.sh'
    }

    File['/root/.setup/firstboot/']          -> File['/root/.setup/firstboot/reboot.sh']
    File['/root/.setup/firstboot/reboot.sh'] -> Exec['reboot.sh']

}
