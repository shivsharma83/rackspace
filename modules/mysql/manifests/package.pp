class mysql::package {

    package { 'mysql-server':  
      ensure  => present,
      notify  => Service['mysql'],
    }
    package { 'mysql-client': ensure  => present }
}

