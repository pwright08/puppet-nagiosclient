# == Class nagiosclient::c_plugins
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
class nagiosclient::c_plugins (
  $c_package_name                        = $nagiosclient::c_params::c_package_name,
  $c_plugin_dir                          = $nagiosclient::c_params::c_plugin_dir
  ){

  notify { "## --->>> Installing extra client plugins for package: ${c_package_name}":
  }

  # put the extra plugins command in place
  file { "${c_plugin_dir}/check_unix_mem_usage.pl":
    ensure                             => file,
    owner                              => 'root',
    group                              => 'root',
    mode                               => '0644',
    replace                            => true,
    source                             => "puppet:///modules/nagiosclient/check_unix_mem_usage.pl"
    }

  file { "${c_plugin_dir}/check_net_stat.pl":
    ensure                             => file,
    owner                              => 'root',
    group                              => 'root',
    mode                               => '0644',
    replace                            => true,
    source                             => "puppet:///modules/nagiosclient/check_net_stat.pl"
    }

  file { "${c_plugin_dir}/check_linux_stats.pl":
    ensure                             => file,
    owner                              => 'root',
    group                              => 'root',
    mode                               => '0644',
    replace                            => true,
    source                             => "puppet:///modules/nagiosclient/check_linux_stats.pl"
    }

  file { "${c_plugin_dir}/check_mem.pl":
    ensure                             => file,
    owner                              => 'root',
    group                              => 'root',
    mode                               => '0644',
    replace                            => true,
    source                             => "puppet:///modules/nagiosclient/check_mem.pl"
    }

  }


# vim: set ts=2 sw=2 et :
