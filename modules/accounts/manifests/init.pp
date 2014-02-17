class accounts {
    include accounts::virtual::system

    @file { "/home":
        ensure  => directory,
    }
}
