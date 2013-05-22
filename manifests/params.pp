# == Class krb5::params
# This class is meant to be called from krb5
# It set variable according to platform
class krb5::params {
  $pkgname = [
    'krb5-libs',
    'krb5-workstation',
    'pam_krb5',
    'oddjob-mkhomedir',
  ]
  $conffile = '/etc/krb5.conf'
  $service = $::osfamily ? {
    'RedHat' => 'oddjobd',
    default  => fail('unsupported platform')
  }
}
