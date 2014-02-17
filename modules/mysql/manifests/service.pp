class mysql::service {

  service {'mysql':
    ensure => running, 
    require => Package['mysql-server'],
  }
}
