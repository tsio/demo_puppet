define dcache_node_lofar ($include_tsm = false, $include_layout = false, $include_pm = false,) {
  class { 'dcache':
    package_ensure => hiera('dcache_version'),
    conf           => hiera('dcache_conf_lofar', 'nodef'),
    admin_ssh_keys => hiera('dc_ssh_pub_keys', 'nodef'),
  #      layout_conf => hiera('dcahce_layout'),
  #      dcache_etc_dir => '/tmp/',
  #       require => Yumrepo['test-repo-www'],
  }

  if $include_tsm {
    class { 'dcache::endit':
      owner    => $dcache::dcacheuser,
      group    => $dcache::dcachegroup,
      tsm_conf => 'endit_conf_lofar',
    }
  }

  if $include_layout {
    class { 'dcache::layout':
      layout_hash => hiera('dcache_layout', 'nodef'),
      require     => Class['dcache'],
      p_setup => hiera ( 'pools_setup', 'nodef'),
    }
  }
  #    if $include_pm {
  #      class {'dcache::poolmanager':
  #           require => Class['dcache'],
  #           }
  #    }

}

define dcache_node_ildg ($include_tsm = false,) {
  class { 'dcache':
    package_ensure => hiera('dcache_version'),
    conf           => hiera('dcache_conf_ildg', 'nodef'),
  #      layout_conf => hiera('dcahce_layout'),
  #      dcache_etc_dir => '/tmp/',
  #       require => Yumrepo['test-repo-www'],
  }

  #        notify { "test":
  #           message => $dcache_version }
  if $include_tsm {
    class { 'dcache::endit':
      owner    => $dcache::dcacheuser,
      group    => $dcache::dcachegroup,
      tsm_conf => 'endit_conf_ildg',
      require  => Class['dcache'],
    }
  }

}
