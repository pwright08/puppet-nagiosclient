puppet-nagiosclient
===================

## Overview

This module manages a simple nagios clent installation. It is intended to be
used in conjunction with a profile manifest that will configure additional nrpe
commands and export nagios resources for collection by a nagios server.

``` puppet

class { 'nagiosclient':
  nrpe_commands => ['command[check_sshd]=/usr/lib64/nagios/plugins/check_procs -c 1: -w 3: -C sshd']
}

# Export nagios host configuration
@@nagios_host { $::fqdn :
  ensure                => present,
  alias                 => $::hostname,
  address               => inline_template("<%= scope.lookupvar('::ipaddress_${interface}') -%>"),
  mode                  => '0644',
  owner                 => root,
  use                   => 'linux-server',
  max_check_attempts    => '5',
  check_period          => '24x7',
  notification_interval => '30',
  notification_period   => '24x7'
}

# Export nagios service configuration
@@nagios_service { "check_ping_${::hostname}":
  ensure              => present,
  check_command       => 'check_ping!100.0,20%!500.0,60%',
  mode                => '0644',
  owner               => root,
  use                 => 'generic-service',
  host_name           => $::hostname,
  notification_period => '24x7',
  service_description => 'Ping'
}

@@nagios_service { "check_load_${::hostname}":
  ensure              => present,
  check_command       => 'check_nrpe!check_load\!5.0,4.0,3.0\!10.0,6.0,4.0',
  mode                => '0644',
  owner               => root,
  use                 => 'generic-service',
  host_name           => $::hostname,
  notification_period => '24x7',
  service_description => 'Current Load'
}

```
Additionally the profile manifest can be used to configure additionl nrpe
commands and nagios resources from heira.

``` puppet
# create additional nrpe commands from hiera
class { 'nagiosclient':
  nrpe_commands => hiera_array('nrpe_commands', undef)
}

# create additional nagios services from hiera
if $nagios_services {
  create_resources('@@nagios_service', $nagios_services)
}
```

## Executing The Module

This will run the init.pp test in the tests folder.

```
vagrant up
```

## How to run tests

Run these as a normal user (not root)

```
vagrant up
vagrant ssh
cd /vagrant
sudo yum install -y ruby-devel libffi-devel gcc gcc-c++ libxml2-devel
gem install bundler
bundle install
rake validation
```
