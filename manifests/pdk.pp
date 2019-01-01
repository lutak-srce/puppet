#
# = Class: puppet::pdk
#
# Puppet Development Kit, installed from package
class puppet::pdk (
  $ensure  = 'present',
  $package = 'pdk',
  $noops   = undef,
) {

  # package and service
  package { 'pdk':
    ensure => $ensure,
    name   => $package,
    noop   => $noops,
  }

}
