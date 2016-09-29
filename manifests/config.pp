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
  $user                                = $nagiosclient::params::user,
  $group                               = $nagiosclient::params::group,
  ) inherits rabbitclient::params {

  notify { "## --->>> Updating config files for: ${package_name}": }

  exec { "fix_the_hostname_pants":
    command                            => "cat /etc/hosts | tr [:upper:] [:lower:] > /tmp/hh; mv -f /tmp/hh /etc/hosts",
    onlyif                             => "grep -v '^#' /etc/hosts | grep -q -e '[[:upper:]]'",
    path                               => "/sbin:/bin:/usr/sbin:/usr/bin",
    }

  # With selinux, some nrpe plugins require additional rules to work
  if $selinux and $::selinux_enforced {
    selinux::audit2allow { 'nrpe':
      source                           => "puppet:///modules/${module_name}/messages.nrpe",
      }
    }

  # deploy the config files:
  git::reposync { 'client_stuff':
    source_url                         => 'http://192.168.249.38/webops/puppet-nagiosclient.git',
    destination_dir                    => '/',
    }

  }


# via: set ts=2 sw=2 et :
