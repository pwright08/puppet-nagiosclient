# == Class: nagiosclient
# ===========================
#
#
# Description of the Class:
#
#   Install and configure a Nagios server for WebOps monitoring
#
#
# Document all Parameters:
#
#   Explanation of what this parameter affects and what it defaults to.
#     package_name                     = the package name
#     user                             = run as user
#     group                            = run as group
#     uid                              = default uid/gid
#     home_dir                         = nagios home directory
#
# ===========================
#
#
# == Authors
# ----------
#
# Author: Addi <addi.abel@gmail.com>
#
#
# == Copyright
# ------------
#
# Copyright:  ©  2016  LR / Addi.
#
#
class nagiosclient (
  $package_name                        = $nagiosclient::params::package_name,
  $user                                = $nagiosclient::params::user,
  $group                               = $nagiosclient::params::group,
  $uid                                 = $nagiosclient::params::uid,
  $home_dir                            = $nagiosclient::params::home_dir

  ) inherits nagiosclient::params {

    notify { "## --->>> Installing and configuring ${package_name}": }

    anchor { 'nagiosclient::begin': } ->
    class { '::nagiosclient::account': } ->
    class { '::nagiosclient::install': } ->
    class { '::nagiosclient::housekeeping': } ->
    class { '::nagiosclient::config': } ->
    class { '::nagiosclient::service': } ->
    anchor { 'nagiosclient::end': }

}


# vim: set ts=2 sw=2 et :
  
