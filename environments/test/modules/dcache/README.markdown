The Dcache module allows you to easily manage dCache instance with Puppet.

Install dcache  with default configuration: 
	class  { 'dcache': }


	 class
     {   'dcache::endit': 
           owner => $dcache::dcacheuser,
           group=> $dcache::dcachegroup,
           tsm_conf=> 'endit_conf_ildg',
           require => Class['dcache'],
      }
    }


   class  { 'dcache' :
      package_ensure => '2.10.41-1',
      conf => 'dcache_conf_ildg
      ',
#      layout_conf => hiera('dcahce_layout'),
#      dcache_etc_dir => '/tmp/',
#       require => Yumrepo['test-repo-www'],
  }
#        notify { "test":
#           message => $dcache_version }
    if $include_tsm
    {     
      class
     {   'dcache::endit': 
           owner => $dcache::dcacheuser,
           group=> $dcache::dcachegroup,
           tsm_conf=> 'endit_conf_ildg',
           require => Class['dcache'],
      }
    }
