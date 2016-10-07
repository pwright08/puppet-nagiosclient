# == Class nagiosclient::params
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
class nagiosclient::params {

  $package_name                        = 'nagios-client'
  $user                                = 'nagios'
  $group                               = 'nagios'
  $userid                              = '240'
  $grpuid                              = '240'
  $home_dir                            = '/var/spool/nagios'
  $config_dir                          = '/etc/nagios'
  $plugin_dir                          = '/usr/lib64/nagios/plugins'

  }


# vim: set ts=2 sw=2 et :
