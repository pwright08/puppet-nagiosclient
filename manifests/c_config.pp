# == Class nagiosclient::c_config
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
class nagiosclient::c_config (

  $c_package_name     = $nagiosclient::c_params::c_package_name,
  $c_config_dir       = $nagiosclient::c_params::c_config_dir,
  $c_plugin_dir       = $nagiosclient::c_params::c_plugin_dir,
  $c_nagios_server_ip = $nagiosclient::c_nagios_server_ip

  ){

  notify { "## --->>> Updating client config files for: ${c_package_name} ": }

  # put the command file for nrpe in place
  file { "${c_config_dir}/nrpe.cfg":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    replace => true,
    content => template('nagiosclient/nrpe.cfg.erb'),
    notify  => Service['nrpe']
  }

}


# vim: set ts=2 sw=2 et :
