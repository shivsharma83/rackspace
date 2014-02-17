class mysql::db( $name, $user, $password ) {
      require mysql::package
      require mysql::service 
    
    exec { "create-${name}-db":
      unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
      command => "/usr/bin/mysql -uroot -p$mysql_password -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
      require => Service["mysql"],
    }
}
