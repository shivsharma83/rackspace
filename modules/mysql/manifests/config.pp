class mysql::config ($user, $password) {
    require ::mysql::package

    file {
        "/etc/mysql":
            ensure  => directory;
        "/etc/mysql/conf.d":
            ensure  => directory,
            recurse => true,
            purge   => true;
        "/etc/mysql/my.cnf":
            source  => "puppet:///modules/mysql/etc/my.cnf",
            require => File["/etc/mysql"];
	"/etc/mysql/conf.d/mysqld_safe_syslog.cnf":
	    ensure  => present,
            require => File['/etc/mysql/conf.d'],
    }
    exec { "set-mysql-password":
        unless => "mysqladmin -uroot -p$password status",
        path => ["/bin", "/usr/bin"],
        command => "mysqladmin -uroot password $password",
        require => Service["mysql"],
     }

}

