# /etc/puppet/manifests/site.pp

stage { 'first': before => Stage['main'], }

node 'localhost.localdomain' {
  class { 'common': stage => first, }

  class { 'postgresql::globals':
    encoding             => 'UTF-8',
    locale               => 'en_US.UTF-8',
    pg_hba_conf_defaults => false,
  } ->
  class { 'postgresql::server': }

  create_resources(postgresql::server::pg_hba_rule, hiera(pg_hba_rules, 'nodeff'))

  #  postgresql::server::pg_hba_rule { 'Dcache_01':
  #    description => 'local is for Unix domain socket connections only',
  #    type        => 'local',
  #    database    => 'all',
  #    user        => 'all',
  #    address     => '',
  #    auth_method => 'trust',
  #  }

  #  postgresql::server::pg_hba_rule { 'Dcache_02':
  #    description => 'local  IPv4',
  #    type        => 'host',
  #    database    => 'all',
  #    user        => 'all',
  #    address     => '127.0.0.1/32',
  #    auth_method => 'trust',
  #  }

  #  postgresql::server::pg_hba_rule { 'Dcache_03':
  #    description => 'local  IPv6',
  #    type        => 'host',
  #    database    => 'all',
  #    user        => 'all',
  #    address     => '::1/128',
  #    auth_method => 'trust',
  #  }

  postgresql::server::role { 'chimera': } ->
  postgresql::server::db { 'chimera':
    owner    => 'chimera',
    user     => 'chimera',
    password => undef,
  }

  postgresql::server::role { 'srmdcache': } ->
  postgresql::server::db { 'dcache':
    owner    => 'srmdcache',
    user     => 'srmdcache',
    password => undef,
  } ->
  postgresql::server::db { 'billing':
    owner    => 'srmdcache',
    user     => 'srmdcache',
    password => undef,
  }

  class { 'dcache':
    package_ensure => hiera('dcache_version'),
    conf           => hiera('dcache_conf', 'nodeff'),
    admin_ssh_keys => hiera('dc_ssh_pub_keys', 'nodeff'),
    layout         => hiera('dcache_layout', 'nodeff'),
    pools_setup    => hiera('pools_setup', 'nodeff'),
    require        => [
      Package['java-1.8.0-openjdk'],
      Postgresql::Server::Db['billing'],
      Postgresql::Server::Db['chimera'],
      Postgresql::Server::Db['dcache'],
      Class['postgresql::server']]
  }

  package { 'java-1.8.0-openjdk': ensure => 'installed', }

}

