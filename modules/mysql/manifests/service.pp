class mysql::service {

  service {'mysql':
    ensure => running, 
    require => Class['mysql::package'],
  }
}
