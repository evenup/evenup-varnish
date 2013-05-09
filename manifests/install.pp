# == Class: varnish::install
#
# This class installs varnish.  It is not meant to be called directly.
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
#
# === Copyright
#
# Copyright 2013 EvenUp.
#
class varnish::install (
  $version,
){

  package { 'varnish':
    ensure  => $version,
    notify  => Class['varnish::service'],
  }

}
