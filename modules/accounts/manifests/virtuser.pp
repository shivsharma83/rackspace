# Define: accounts::virtuser
#
define accounts::virtuser(
    $fullname,
    $group,
    $ensure = present,
    $groups = [],
    $homepath = '/home',
    $managehome = true,
    $shell = '/bin/false',
    $ssh_key = '',
    $home_dir_mode = '0700'
) {
    $home = "${homepath}/${name}"

    $ensure_directory = $ensure ? {
        'present' => directory,
        default   => undef,
    }
    $uid_real = $uid ? {
        ''        => undef,
        default   => $uid,
    }
    $owner_real = $ensure ? {
        'absent'    => undef,
        default     => $name,
    }
    $group_real = $ensure ? {
        'absent'    => undef,
        default     => $group,
    }

    realize(Accounts::Virtgroup[$group])
    realize(Accounts::Virtgroup[$groups])
    realize(File[$homepath])

    user { $name:
        ensure     => $ensure,
        groups     => $groups,
        comment    => $fullname,
        home       => $home,
        shell      => $shell,
        membership => inclusive,
        managehome => $managehome,
        require     => [
            Group[$group],
            File[$homepath]
        ],
    }
    file {
        $home:
            ensure  => $ensure_directory,
            replace => false,
            owner   => $owner_real,
            group   => $group_real,
            mode    => $home_dir_mode,
            require => User[$name];
        "${home}/.ssh/authorized_keys2":
            ensure  => absent;
    }

    if $ssh_key {
        file {
            "${home}/.ssh":
                ensure  => $ensure_directory,
                force   => true,
                owner   => $owner_real,
                group   => $group_real,
                mode    => '0700',
                require => File[$home];
            "${home}/.ssh/authorized_keys":
                ensure  => $ensure,
                source  => $ssh_key,
                owner   => $owner_real,
                group   => $group_real,
                mode    => '0600',
                require => File["${home}/.ssh"];
        }
    } else {
        file {
            "${home}/.ssh/authorized_keys":
                ensure  => absent;
        }
    }
}
