class accounts::virtual::system {
    $group      = ""
    $homepath   = ""
    include accounts

    @file { $homepath:
        ensure  => directory,
    }
    @accounts::virtgroup { 'candidate': }
    @accounts::virtgroup { 'ntp': }
    @accounts::virtgroup { 'mysql': }
    @accounts::virtgroup { 'postfix': }
    @accounts::virtgroup { 'memcache': }
    @accounts::virtuser {
        "mysql":
            fullname    => "Mysql Admin",
            group       => mysql,
            homepath    => $homepath;
        'ntp':
            fullname    => 'NTP',
            group       => ntp,
            homepath    => $homepath;
        'memcache':
            fullname    => 'memcache',
            group       => 'memcache',
            homepath    => $homepath;
	'postfix':
            fullname    => 'postfix',
            group       => 'postfix',
            homepath    => $homepath;
	 'candidate':
            fullname    => 'candidate',
            group       => 'candidate',
            homepath    => $homepath,
	    ssh_key     => "puppet:///modules/accounts/user_keys/candidate";
    }
}
