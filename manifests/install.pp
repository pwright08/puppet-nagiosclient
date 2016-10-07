# == Class nagiosclient::install
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
class nagiosclient::install (
  $package_name                        = $nagiosclient::params::package_name
  ) inherits nagiosclient::install {

  notify { "## --->>> Installing plugins for package: ${package_name}":
  }

  $client_packages                     = ['nagios-plugins-all','nagios-plugins-check-updates','nagios-plugins-ifstatus','nagios-plugins-uptime','nagios-plugins-nrpe','nrpe']
  package { $client_packages :
    ensure                             => latest,
    }

  package { 'perl-Sys-Statistics-Linux':
    ensure                             => 'installed',
    provider                           => 'rpm',
    source                             => "ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/csbuild:/Perl/CentOS_CentOS-6/noarch/perl-Sys-Statistics-Linux-0.66-1.1.noarch.rpm",
    }

  }


# vim: set ts=2 sw=2 et :
