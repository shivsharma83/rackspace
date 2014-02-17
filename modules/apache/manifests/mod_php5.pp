class apache::mod_php5 {
    include ::php5

    package { "libapache2-mod-php5":
	ensure  => present, 
        require => [Class['php5'], Class['apache::package']], 
    }
    exec { "enable_mod_php5":
         command => "a2enmod php5",
	 path    => "/usr/bin:/usr/local/bin:/usr/sbin", 
         notify  => Class['apache::service'],
    }

}
