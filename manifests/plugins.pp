# == Class nagiosclient::plugins
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
class nagiosclient::plugins (
  $package_name                        = $nagiosclient::params::package_name,
  $plugin_dir                          = $nagiosclient::params::plugin_dir
  ) inherits nagiosclient::plugins {

  notify { "## --->>> Installing extra plugins for package: ${package_name}":
  }

  # put the extra plugins command in place
  file { "${plugin_dir}/check_unix_mem_usage.pl":
    ensure                             => file,
    owner                              => 'root',
    group                              => 'root',
    mode                               => '0644',
    replace                            => true,
    source                             => "puppet:///modules/nagiosclient/check_unix_mem_usage.pl"
    }

  file { "${plugin_dir}/check_net_stat.pl":
    ensure                             => file,
    owner                              => 'root',
    group                              => 'root',
    mode                               => '0644',
    replace                            => true,
    source                             => "puppet:///modules/nagiosclient/check_net_stat.pl"
    }

  file { "${plugin_dir}/check_linux_stats.pl":
    ensure                             => file,
    owner                              => 'root',
    group                              => 'root',
    mode                               => '0644',
    replace                            => true,
    source                             => "puppet:///modules/nagiosclient/check_linux_stats.pl"
    }

  file { "${plugin_dir}/check_mem.pl":
    ensure                             => file,
    owner                              => 'root',
    group                              => 'root',
    mode                               => '0644',
    replace                            => true,
    source                             => "puppet:///modules/nagiosclient/check_mem.pl"
    }

  }


# vim: set ts=2 sw=2 et :
