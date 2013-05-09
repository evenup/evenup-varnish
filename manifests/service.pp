# == Class: varnish::service
#
# This class mangaes the varnish service.  It is not inteded to be called
# directly
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
class varnish::service (
) {

  service { 'varnish':
    ensure    => 'running',
    hasstatus => true,
    enable    => true,
    require   => Package['varnish']
  }

}
