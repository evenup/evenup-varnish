# == Class: varnish
#
# This class installs and configures varnish
#
#
# === Parameters
#
# [*version*]
#   String.  What version of varnish should be installed
#   Default: latest
#
# [*vcl_source*]
#   String.  Source file for varnish config
#   Default: undef
#
# [*listen_address*]
#   String.  Address varnish should listen on
#   Default: 0.0.0.0
#
# [*listen_port*]
#   Integer.  Port varnish should listen on
#   Default: 80
#
# [*admin_listen_address*]
#   String.  Address the admin interface should listen on
#   Default: 127.0.0.1
#
# [*admin_listen_port*]
#   Integer.  Port the varnish admin interface should listen on
#   Default: 6081
#
# [*secret_file*]
#   String.  Varnish secret file
#   Default: /etc/varnish/secret
#
# [*min_threads*]
#   Integer.  Minimum number of worker threads
#   Default: 50
#
# [*max_threads*]
#   Integer.  Maximum number of worker threads
#   Default: 100
#
# [*thread_timeout*]
#   Integer.  Thread timeout
#   Default: 120
#
# [*storage_size*]
#   String.  How large the memory storage pool should be
#   Default: 100M
#
# [*ttl*]
#   Integer.  Default TTL
#   Default: 120
#
#
# === Examples
#
# * Installation:
#     class { 'varnish': }
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
class varnish(
  $version              = 'latest',
  $vcl_source           = 'puppet:///modules/varnish/varnish.vcl',
  $listen_address       = '0.0.0.0',
  $listen_port          = 80,
  $admin_listen_address = '127.0.0.1',
  $admin_listen_port    = 6081,
  $secret_file          = '/etc/varnish/secret',
  $min_threads          = 50,
  $max_threads          = 100,
  $thread_timeout       = 120,
  $storage_size         = '100M',
  $ttl                  = 120,
  $start                = true,
) {

  class { 'varnish::install':
    version => $version
  }

  class { 'varnish::config':
    vcl_source            => $vcl_source,
    listen_address        => $listen_address,
    listen_port           => $listen_port,
    admin_listen_address  => $admin_listen_address,
    admin_listen_port     => $admin_listen_port,
    secret_file           => $secret_file,
    min_threads           => $min_threads,
    max_threads           => $max_threads,
    thread_timeout        => $thread_timeout,
    storage_size          => $storage_size,
    ttl                   => $ttl,
    start                 => $start,
  }
  class { 'varnish::service': }

  anchor { 'varnish::begin': }
  anchor { 'varnish::end': }

  Anchor['varnish::begin'] ->
  Class['varnish::install'] ->
  Class['varnish::config'] ~>
  Class['varnish::service'] ->
  Anchor['varnish::end']
}
