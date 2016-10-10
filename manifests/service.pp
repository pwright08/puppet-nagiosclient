# == Class nagiosclient::service
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
class nagiosclient::service (
  $package_name                        = $nagiosclient::params::package_name
  ) inherits nagiosclient::params {
  
  notify { "## --->>> Configuring service for: ${package_name}": } ~>

  service { 'nrpe':
    ensure                             => running,
    enable                             => true,
    }

  }


# vim: set ts=2 sw=2 et :
