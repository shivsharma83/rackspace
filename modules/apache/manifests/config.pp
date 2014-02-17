class apache::config {
    require apache::package

    file {
        "/etc/apache2/ports.conf":
	    ensure  => present,
            source  => "puppet:///modules/apache/etc/apache2/ports.conf",
	    notify  => Class['apache::service'];
        "/etc/apache2/conf.d/security.conf":
            ensure  => present,
            source  => "puppet:///modules/apache/etc/apache2/conf.d/security.conf",
	    notify  => Class['apache::service'];
	"/etc/apache2/conf.d/charset.conf":
            ensure  => present,
            source  => "puppet:///modules/apache/etc/apache2/conf.d/charset.conf",
	    notify  => Class['apache::service'];
    }
}
