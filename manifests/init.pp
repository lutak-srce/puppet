#
# = Class: puppet
#
# This module manages puppet and is standard for all hosts
class puppet (
  $ensure                     = 'present',
  $package                    = 'puppet-agent',
  $version                    = undef,
  $service                    = 'puppet',
  $service_ensure             = 'running',
  $service_enable             = true,
  $storeconfigs_backend       = undef,
  $reports                    = 'store',
  $dns_alt_names              = undef,
  $certname                   = undef,
  $server                     = undef,
  $noops                      = undef,
  $runinterval                = undef,
  $http_connect_timeout       = undef,
  $number_of_facts_soft_limit = undef,
) {

  # file defaults
  File {
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['puppet'],
    noop    => $noops,
  }

  # package and service
  package { 'puppet':
    ensure => $ensure,
    name   => $package,
    noop   => $noops,
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

  file { '/etc/profile.d/puppet_env.sh':
    source => 'puppet:///modules/puppet/puppet_env.sh',
  }

}
