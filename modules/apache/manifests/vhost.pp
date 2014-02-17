define apache::vhost (
) {
    include apache
    file {
        '/etc/apache2/sites-available/wordpress.conf':
            ensure  => present,
	    source  => "puppet:///modules/apache/etc/apache2/site-avaiable/wordpress.conf";
        '/etc/apache2/sites-enabled/wordpress.conf':
            ensure  => link,
	    target  => "../sites-available/wordpress.conf",
	    notify  => Class['apache::service'];
    }
}
