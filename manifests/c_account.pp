# == Class nagiosclient::c_account
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
class nagiosclient::c_account (

  $c_package_name = $nagiosclient::c_params::c_package_name,
  $c_user         = $nagiosclient::c_params::c_user,
  $c_group        = $nagiosclient::c_params::c_group,
  $c_uid          = $nagiosclient::c_params::c_uid,
  $c_guid         = $nagiosclient::c_params::c_guid,
  $c_home_dir     = $nagiosclient::c_params::c_home_dir

  ){

  notify { "## --->>> Creating client accounts for: ${c_package_name}": }

  group { $c_group:
    ensure => 'present',
    gid    => $c_guid
  }

  user { $c_user:
    ensure     => 'present',
    home       => $c_home_dir,
    shell      => '/bin/bash',
    uid        => $c_uid,
    gid        => $c_guid,
    password   => '!!',
    managehome => true,
  }

  file { '/etc/sudoers.d/20-nagios' :
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/nagiosclient/20-nagios',
  }

}



# vim: set ts=2 sw=2 et :
