class mysql::package {

    package { 'mysql-server': ensure  => present }
    package { 'mysql-client': ensure  => present }
}

