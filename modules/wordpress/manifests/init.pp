class wordpress {
  require apache
  require mysql
  require php5
  require php5-mysql
  require memcached


  exec {'wordpress':
    command => 'wget https://wordpress.org/latest.tar.gz ; tar -xvzf latest.tar.gz -C /var/www/vhosts/lin-test.rackstage.co.uk/public_html/ --strip-components 1',
    cwd     => '/var/www/vhosts/lin-test.rackstage.co.uk/public_html/',
    path    => '/usr/bin:/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin',
   }

  file {
  '/var/www/vhosts/lin-test.rackstage.co.uk/public_html/wp-config.php':
    ensure  => 'present',
    require => [Exec['wordpress'],File['/var/www/vhosts/lin-test.rackstage.co.uk/public_html']],
    source  => "puppet:///modules/wordpress/var/wp-config.php",
    owner   => nobody,
    group   => nogroup,
    notify  => Class['apache::service'];
  '/var/www/vhosts/lin-test.rackstage.co.uk/public_html':
   ensure => directory,
   owner => nobody,
   group => nogroup,
   require => File['/var/www/vhosts/lin-test.rackstage.co.uk'];
  '/var/www/vhosts/lin-test.rackstage.co.uk':
   ensure => directory,
   owner => root,
   group => root,
   require => File['/var/www/vhosts'];
  '/var/www/vhosts':
   ensure => directory,
   owner => root,
   group => root,
   require => Class['apache::package'];
   
   }
}
