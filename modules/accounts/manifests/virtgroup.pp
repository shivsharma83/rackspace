# Define: accounts::virtgroup
#
define accounts::virtgroup(
    $ensure = present,
    $gid = '',
    $system = ''
) {
    $gid_real = $gid ? {
        ''      => undef,
        default => $gid,
    }
    $system_real = $system ? {
        ''      => undef,
        default => false,
    }

    group { $name:
        ensure => $ensure,
        gid    => $gid_real,
        system => $system_real,
    }
}
