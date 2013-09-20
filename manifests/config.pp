# == Class: apache
#
# This class configures varnish.  See the init.pp for expliation of the config
# parameters.  This class is not intended to be called directly.
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
class varnish::config (
  $vcl_content,
  $listen_address,
  $listen_port,
  $admin_listen_address,
  $admin_listen_port,
  $secret_file,
  $min_threads,
  $max_threads,
  $thread_timeout,
  $storage_size,
  $ttl,
){

  # TODO - need to make varnish.d directory and populate with a define
  # varnish.vcl should just include each vcl in the define
  # generate with concat?
  # Shell script: http://errors.bz/Questions/does-varnish-config-include-statement-support-wildcards-159964.html

  file { '/etc/varnish/varnish.vcl':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    content => $vcl_content,
  }

    case $::operatingsystem {
        debian:   { $use_sysctl = false }
        ubuntu:   { $use_sysctl = false }
        centos:   { $use_sysctl = true }
        redhat:   { $use_sysctl = true }
        default:  { $use_sysctl = true }
    }

    if $use_sysctl {
        file { '/etc/sysconfig/varnish':
            ensure  => file,
            owner   => 'root',
            group   => 'root',
            mode    => '0444',
            content => template('varnish/varnish.sysctl.erb'),
        }
    } else {
        file { '/etc/default/varnish':
            ensure  => file,
            owner   => 'root',
            group   => 'root',
            mode    => '0444',
            content => template('varnish/varnish.default.erb'),
        }
    }
}
