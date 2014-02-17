class mysql ($user = 'root', $password = 'Passw0rd!') { 
    include ::mysql::package
    class {'::mysql::config':
             user => "$user", 
             password => "$password" 
    }

    include ::mysql::service 
    class {'::mysql::db': 
        name     =>  'lintest_wpdb',
        user     => 'lintest_user',
        password => 'YsbaFTP875qn_xKqQWY5',
        require  => Class['mysql::package'],
        notify   => Class['mysql::service'],
   }
}
