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
#
#     c_nagios_server_ip                 = the nagios server ip
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

  ){

  include nagiosclient::c_params

  notify { "## --->>> Installing client ${nagiosclient::c_params::package_name}": }

  anchor { 'nagiosclient::begin': } ->
  class { '::nagiosclient::c_account': } ->
  class { '::nagiosclient::c_install': } ->
  class { '::nagiosclient::c_config': } ->
  class { '::nagiosclient::c_plugins': } ->
  class { '::nagiosclient::c_service': } ->
  anchor { 'nagiosclient::end': }

}


# vim: set ts=2 sw=2 et :
