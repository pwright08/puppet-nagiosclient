# == Class nagiosclient::account
# ===========================
#
#
# Description of the Class:
#
#   This class is meant to be called from init.pp only.
#
#
# ===========================
#
class nagiosclient::account (
  $package_name                        = $nagiosclient::params::package_name,
  $user                                = $nagiosclient::params::user,
  $group                               = $nagiosclient::params::group,
  $uid                                 = $nagiosclient::params::uid,
  $guid                                = $nagiosclient::params::guid,
  $home_dir                            = $nagiosclient::params::home_dir
  ) inherits nagiosclient::params {

  notify { "## --->>> Creating accounts for: ${package_name}": }

  group { $group:
    ensure                             => 'present',
    gid                                => $guid
    }

  user { $user: 
    ensure                             => 'present',
    home                               => $home_dir,
    shell                              => '/bin/bash',
    uid                                => $uid,
    gid                                => $guid,
    password                           => '!!',
    managehome                         => true,
    }

  file { '/etc/sudoers.d/20-nagios' :
    ensure                             => file,
    owner                              => 'root',
    group                              => 'root',
    mode                               => '0644',
    source                             => "puppet:///modules/nagiosclient/20-nagios",
    }

  }



# vim: set ts=2 sw=2 et :
