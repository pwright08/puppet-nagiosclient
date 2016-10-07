# == Class nagiosclient::tidy
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
class nagiosclient::tidy (
  $package_name                        = $nagiosclient::params::package_name
  ) inherits nagiosclient::params {

  notify { "## --->>> remove unwanted packages for: ${package_name}": }

  package { 'samba-libs':
    ensure                             => purged,
    }

  }


# vim: set ts=2 sw=2 et :
