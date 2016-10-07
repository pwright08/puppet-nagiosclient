# == Class nagiosclient::config
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
class nagiosclient::config (
  $package_name                        = $nagiosclient::params::package_name,
  $config_dir                          = $nagiosclient::params::config_dir,
  $plugin_dir                          = $nagiosclient::params::plugin_dir
  ) inherits nagiosclient::params {

  notify { "## --->>> Updating config files for: ${package_name}": }

  exec { "fix_the_hostname_pants":
    command                            => "cat /etc/hosts | tr [:upper:] [:lower:] > /tmp/hh; mv -f /tmp/hh /etc/hosts",
    onlyif                             => "grep -v '^#' /etc/hosts | grep -q -e '[[:upper:]]'",
    path                               => "/sbin:/bin:/usr/sbin:/usr/bin",
    }

  # With selinux, some nrpe plugins require additional rules to work
  #if $selinux and $::selinux_enforced {
  #  selinux::audit2allow { 'nrpe':
  #    source                           => "puppet:///modules/${module_name}/messages.nrpe",
  #    }
  #  }

  # put the command file for nrpe in place
  file { "${config_dir}/nrpe.cfg":
    ensure                             => file,
    owner                              => 'root',
    group                              => 'root',
    mode                               => '0644',
    replace                            => true,
    source                             => "puppet:///modules/nagiosclient/nrpe.cfg",
    notify                             => Service['nrpe'],
    }

  }


# vim: set ts=2 sw=2 et :
