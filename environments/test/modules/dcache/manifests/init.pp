class dcache (
  $dcacheuser            = 'dcache',
  $dcachegroup           = 'dcache',
  $package_ensure        = 'lastest',
  $dcache_etc_dir        = '/etc/dcache',
  $package_name          = 'dcache',
  $conf                  = 'undef',
  $dcache_layout         = 'undef',
  $dcahe_poolmanagerconf = '/var/lib/dcache/config/poolmanager.conf',
  $admin_ssh_keys = 'nodef', ) {


  anchor { 'dcache::start': } ->
  class { 'dcache::install': 
#    require => Package['java-1.8.0-openjdk']
  } ->
  class { 'dcache::config': conf => $conf, } ->
 # class  {'dcache::service':  } ->
  #  #Class  [ "dcache::install" ] ->
  anchor { 'dcache::end': }
  
}
