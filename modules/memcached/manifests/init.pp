class memcached {
  package {'memcached':
    ensure => present,
    notify => Service['memcached'],
  }
  service {'memcached':
    ensrue => running,
    require => Package['memcached'],
 }
}
