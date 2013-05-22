# == Class krb5::config
# This class is meant to be called from krb5
# it bakes the configuration file
# === Parameters
#
# [*options*]
#   A hash of extra options to set in the configuration
#
# === Example
#
#  class { krb5:
#    options => {
#      'key1' => 'value1',
#      'key2' => 'value2',
#    }
#  }
class krb5::config(
    $servers=$krb5::servers,
    $options=$krb5::options,
    ) {
  include krb5::params
  file { $krb5::params::conffile:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => template('krb5/krb5.conf.erb')
  }
}

