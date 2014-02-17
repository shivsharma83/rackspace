node vagrant-ubuntu {
  Accounts::Virtuser <|
        title == 'ntp' or
        title == 'mysql' or 
        title == 'memcache' or 
        title == 'postfix' or 
        title == 'candidate'
    |>


  include wordpress
}
