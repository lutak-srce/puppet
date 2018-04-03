#
# = Class: puppet
#
# This module manages puppet and is standard for all hosts
class puppet (
  $ensure               = 'present',
  $package              = 'puppet-agent',
  $version              = undef,
  $service              = 'puppet',
  $service_ensure       = 'running',
  $service_enable       = true,
  $storeconfigs_backend = undef,
  $dns_alt_names        = undef,
  $certname             = undef,
  $server               = undef,
  $noops                = undef,
) {

  # file defaults
  File {
    ensure  => $file_ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['puppet'],
    noop    => $noops,
  }

  # package and service
  package { 'puppet':
    ensure => $package_ensure,
    name   => $package,
    noop   => $noops,
  }

  user { 'puppet':
    require => Package['puppet'],
    noop    => $noops,
  }

  group { 'puppet':
    require => Package['puppet'],
    noop    => $noops,
  }

  service { 'puppet':
    ensure  => $service_ensure,
    enable  => $service_enable,
    name    => $service,
    require => File['/etc/puppetlabs/puppet/puppet.conf'],
    noop    => $noops,
  }

  # files
  file { '/etc/puppetlabs/puppet/puppet.conf':
    content => template('puppet/puppet.conf.erb'),
  }

}
