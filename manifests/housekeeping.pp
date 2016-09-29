# == Class nagiosclient::housekeeping
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
class nagiosclient::housekeeping (
  $package_name                        = $nagiosclient::params::package_name
  ) inherits nagiosclient::params {

  notify { "## --->>> housekeeping packages for: ${package_name}": }

  $unwanted                            = ['samba-libs','samba-common','samba-client-libs','samba-client','samba-common-tools','samba-common-libs']
  package { $unwanted:
    ensure                             => purged,
    }

  }


# vim: set ts=2 sw=2 et :
