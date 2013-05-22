# == Class krb5::service
# This class is meant to be called from krb5
# It ensure the service is running
class krb5::service {
  include krb5::params
  service { $krb5::params::service:
    ensure => running,
    enable => true,
  }
}
