# == Class nagiosclient::c_install
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
class nagiosclient::c_install (

  $c_package_name = $nagiosclient::c_params::c_package_name

  ){

  notify { "## --->>> Installing plugins for package: ${c_package_name}":}

  $client_packages = ['nrpe', 'perl-Data-Dumper','nagios-plugins-apt.x86_64',
    'nagios-plugins-bacula.x86_64', 'nagios-plugins-bonding.x86_64',
    'nagios-plugins-breeze.x86_64', 'nagios-plugins-by_ssh.x86_64',
    'nagios-plugins-check-updates.x86_64', 'nagios-plugins-cluster.x86_64',
    'nagios-plugins-dbi.x86_64', 'nagios-plugins-dhcp.x86_64',
    'nagios-plugins-dig.x86_64', 'nagios-plugins-disk.x86_64',
    'nagios-plugins-dns.x86_64', 'nagios-plugins-dpm-disk.x86_64',
    'nagios-plugins-dpm-head.x86_64', 'nagios-plugins-dummy.x86_64',
    'nagios-plugins-file_age.x86_64', 'nagios-plugins-flexlm.x86_64',
    'nagios-plugins-fping.x86_64', 'nagios-plugins-game.x86_64',
    'nagios-plugins-hpjd.x86_64', 'nagios-plugins-http.x86_64',
    'nagios-plugins-icmp.x86_64', 'nagios-plugins-ide_smart.x86_64',
    'nagios-plugins-ifoperstatus.x86_64', 'nagios-plugins-ifstatus.x86_64',
    'nagios-plugins-ircd.x86_64', 'nagios-plugins-lcgdm.x86_64',
    'nagios-plugins-lcgdm-common.x86_64', 'nagios-plugins-ldap.x86_64',
    'nagios-plugins-lfc.x86_64', 'nagios-plugins-load.x86_64',
    'nagios-plugins-log.x86_64', 'nagios-plugins-mailq.x86_64',
    'nagios-plugins-mrtg.x86_64', 'nagios-plugins-mrtgtraf.x86_64',
    'nagios-plugins-mysql.x86_64', 'nagios-plugins-nagios.x86_64',
    'nagios-plugins-nrpe.x86_64', 'nagios-plugins-nt.x86_64',
    'nagios-plugins-ntp.x86_64', 'nagios-plugins-ntp-perl.x86_64',
    'nagios-plugins-nwstat.x86_64', 'nagios-plugins-openmanage.x86_64',
    'nagios-plugins-oracle.x86_64', 'nagios-plugins-overcr.x86_64',
    'nagios-plugins-perl.x86_64', 'nagios-plugins-pgsql.x86_64',
    'nagios-plugins-ping.x86_64', 'nagios-plugins-procs.x86_64',
    'nagios-plugins-radius.x86_64', 'nagios-plugins-real.x86_64',
    'nagios-plugins-rpc.x86_64', 'nagios-plugins-sensors.x86_64',
    'nagios-plugins-smtp.x86_64', 'nagios-plugins-snmp.x86_64',
    'nagios-plugins-ssh.x86_64', 'nagios-plugins-swap.x86_64',
    'nagios-plugins-tcp.x86_64', 'nagios-plugins-time.x86_64',
    'nagios-plugins-ups.x86_64', 'nagios-plugins-uptime.x86_64',
    'nagios-plugins-users.x86_64', 'nagios-plugins-wave.x86_64']

  package { $client_packages :
    ensure => present,
  }

  package { 'perl-Sys-Statistics-Linux':
    ensure   => 'installed',
    provider => 'rpm',
    source   => 'ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/csbuild:/Perl/CentOS_CentOS-6/noarch/perl-Sys-Statistics-Linux-0.66-1.1.noarch.rpm',
    require  => Package['perl-Data-Dumper']
  }

}


# vim: set ts=2 sw=2 et :
