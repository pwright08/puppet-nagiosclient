# == Class nagiosclient::c_params
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
class nagiosclient::c_params {

  $c_package_name     = 'nagios-client'
  $c_user             = 'nagios'
  $c_group            = 'nagios'
  $c_userid           = '998'
  $c_grpuid           = '997'
  $c_home_dir         = '/var/spool/nagios'
  $c_config_dir       = '/etc/nagios'
  $c_plugin_dir       = '/usr/lib64/nagios/plugins/'
  }


# vim: set ts=2 sw=2 et :
