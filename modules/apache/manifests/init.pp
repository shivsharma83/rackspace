class apache {
    include ::apache::package
    include ::apache::config
    include ::apache::service
    include ::apache::mod_php5




}
