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
#     userid                           = default uid
#     grpuid                           = default gid
#     home_dir                         = nagios home directory
#     config_dir                       = nagios config directory
#     plugin_dir                       = nagios plugin directory
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
  $userid                              = $nagiosclient::params::userid,
  $grpuid                              = $nagiosclient::params::grpuid,
  $home_dir                            = $nagiosclient::params::home_dir,
  $config_dir                          = $nagiosclient::params::config_dir,
  $plugin_dir                          = $nagiosclient::params::plugin_dir

  ) inherits nagiosclient::params {

    notify { "## --->>> Installing and configuring ${package_name}": }

    anchor { 'nagiosclient::begin': } ->
    class { '::nagiosclient::account': } ->
#   class { '::nagiosclient::install': } ->
    class { '::nagiosclient::tidy': } ->
    class { '::nagiosclient::config': } ->
    class { '::nagiosclient::plugins': } ->
    class { '::nagiosclient::service': } ->
    anchor { 'nagiosclient::end': }

  }


# vim: set ts=2 sw=2 et :
  
