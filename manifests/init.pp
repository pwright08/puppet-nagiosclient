# Class nagiosclient
#
# This class will manage Nagios server installations
#
# Parameters:
#  ['nagios_server'] - IP for the nagios server. Defaults = localhost
#  ['nrpe_commands'] - Array of command lines to be added to nrpe.conf
#
# Example of an npre command: This will check that the service 'sshd' is running
#
#  command[check_sshd]=/usr/lib64/nagios/plugins/check_procs -c 1: -w 3: -C sshd
#
# Requires:
# - puppetlabs/stdlib
#
# Sample Usage:
#
#   include nagiosclient
#
# Hiera Lookups:
#
# There are no heira lookups for this module as such (excluding parameter
# overides). It should be noted that the module deals only with a baisc nagios
# client installation and is designed to be used in conjunction with a profile
# manifest that will configure the nagios resources.

class nagiosclient (

  $nagios_server = 'localhost',
  $nrpe_commands = ''

  ) {

  include ::stdlib

  # Install nagios client packages
  $pkglist=['nrpe','openssl','nagios-plugins-nrpe','nagios-plugins-ping',
            'nagios-plugins-load','nagios-plugins-users','nagios-plugins-disk',
            'nagios-plugins-ssh','nagios-plugins-swap','nagios-plugins-procs']
  ensure_packages($pkglist)

  # Set nagios to read config from default puppet locatons
  file { '/etc/nagios/nrpe.cfg':
    content => template('nagiosclient/nrpe.cfg.erb'),
    owner   => root,
    group   => root,
    mode    => '0664',
    notify  => Service['nrpe'],
    require => Package['nrpe']
  }

  # Ensure nrpe is runnning
  service { 'nrpe':
    ensure  =>'running',
    require => Package['nrpe']
  }

  # Install mem_check plugin
  file { '/usr/lib64/nagios/plugins/check_mem' :
    ensure  => present,
    content => file('nagiosclient/check_mem.pl'),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['nagios-plugins-ping']
  }
}
