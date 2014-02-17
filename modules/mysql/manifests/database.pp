define mysql::db (
) {

  include '::mysql'

  mysqldb { 'lintest_wpdb':

   user => 'lintest_user',
   password => 'YsbaFTP875qn_xKqQWY5',
   require  => [Class['mysql::package'], Class['mysql::config']],
   notify   => Class['mysql::service'],
   }
}

