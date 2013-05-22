# == Class krb5::intall
# This class is meant to be called from krb5
# It install requires packages
class krb5::install {
  include krb5::params
  package { $krb5::params::pkgname:
    ensure => present,
  }
  if krb5::sssd {
    package { 'sssd-client':
      ensure => present,
    }
  }
}
