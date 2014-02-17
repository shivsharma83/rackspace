class apache::package {
    $package_name = $::osfamily ? {
        "redhat" => "httpd",
        "debian" => "apache2",
    }

    package { $package_name: }
}
