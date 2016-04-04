#Class: dc_dcache
#
#
# 
#
#
# No dependencies with other modules
# Classes in this file are required from host_type/*
# Classes in this file require many classes from other .pp files in this module (enstore)
# Here we'll setup all required config files for dCache.

class dcache::configuration::base {

  ####################################################
  ### HIERA DEFINITIONS
  ####################################################
  $dcache_etc_dir    = hiera('dcache_etc_dir')
  $dcache_bin_dir    = hiera('dcache_bin_dir')
  $dcache_conf_dir   = hiera('dcache_conf_dir')
  $dcache_share_dir  = hiera('dcache_share_dir')
  $dcache_lshare_dir = hiera('dcache_lshare_dir')
  $instance          = hiera('instance')
  $nodetype          = hiera('nodetype')
  $dcacheversion     = hiera('dcacheversion')
  $installable       = hiera('installable')
  $dcacheuser        = hiera('dcacheuser')
  $dcachegroup       = hiera('dcachegroup')

        $dcachemajorversion = regsubst($dcacheversion,'(\w+)[.](\w+)-[0-9]+$','\1')

  $srmhost   = hiera('srmhost')
  $corehost   = hiera('corehost')

  $layout_domains  = hiera("layout_domains_${instance}_${dcachemajorversion}",'No funciona')
  $node_domains    = hiera('node_domains','No funciona')
  $pool_settings   = hiera('pool_settings','No funciona')
  $dcache_conf     = hiera("dcache_conf_${instance}_${dcachemajorversion}",'No funciona')
      
        # class common => configures core pic services
  class {
    # Common Classes
    'common::os::release_hiera':;
    'common' :
      cluster       => $nodetype ? { 'pool'      => 'dCache Pools',
 'door'      => 'dCache Doors',
 default     => 'dCache Servers' },
      mcast_ip      => '239.2.11.80',
      pakiti_tag    => 'dCache',
      x11forwarding => 'yes',
      nagios_server => 'icinga02',
      server        => 'puppet03.pic.es',
      disable_relay => true;
    'common::network::tunning::base':
      txqueuelen    => $nodetype   ? { 'pool'      => '50000',
 default     => '10000' },
      tcpwin_start  => $nodetype   ? { 'pool'      => '1048576',
 default     => '131072' };
    'common::ipmi':
      ensure        => $is_virtual ? { false => 'present', true  => 'absent' };
          'common::tripwire':;

    # dCache Classes
    'dcache::ssh::ssh_keys':;
    'dcache::ssh::ssh_config':;
  }

        common::defines::ensure_key_value {
    'dcache_hard_nproc_limits.conf':
      file => '/etc/security/limits.conf',
      key => '@dcache hard nproc',
      value => '65535',
      delimiter => ' ';
    'dcache_soft_nproc_limits.conf':
      file => '/etc/security/limits.conf',
      key => '@dcache soft nproc',
      value => '65535',
      delimiter => ' ';
    'dcache_hard_nofile_limits.conf':
      file => '/etc/security/limits.conf',
      key => '@dcache hard nofile',
      value => '65535',
      delimiter => ' ';
    'dcache_soft_nofile_limits.conf':
      file => '/etc/security/limits.conf',
      key => '@dcache soft nofile',
      value => '65535',
      delimiter => ' ';
  }

  common::defines::replace_line { 'java.security':
    file        => '/etc/alternatives/jre/lib/security/java.security',
    pattern     => '^jdk.certpath.disabledAlgorithms=MD2.*',
    replacement => '#jdk.certpath.disabledAlgorithms=MD2, RSA keySize < 1024';
  }

  ####################################################
  ## INIT: dcache files

  file {
    '/etc/logrotate.d/dcache':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/dcache/common/etc/logrotate.d/dcache';
    "${dcache_conf_dir}/StageConfiguration.conf":
      owner   => $dcacheuser,
      group   => $dcachegroup,
      mode    => '0644',
      source  => "puppet:///modules/dcache/common/etc/dcache/StageConfiguration.conf.${instance}";
    "${dcache_bin_dir}/dcache.local.sh":
      owner   => $dcacheuser,
      group   => $dcachegroup,
      mode    => '0755',
      ensure  => present;
    "${dcache_etc_dir}/layouts/${nodetype}.conf":
      owner   => $dcacheuser,
      group   => $dcachegroup,
      mode    => '0644',
      content => template('dcache/layouts/layout.conf.erb');
    "${dcache_etc_dir}/dcache.conf":
      owner   => $dcacheuser,
      group   => $dcachegroup,
      mode    => '0644',
      content => template('dcache/dcache.conf.erb');
  }

  common::defines::line {
    'dcachelocalsh_ulimit':
      file   => "${dcache_bin_dir}/dcache.local.sh",
      line   => 'ulimit -n 65535',
      ensure => present;
  }
  ## END: dcache files
  ####################################################

  ####################################################
  ## INIT: YAML

  ###############
  # RHN-Channels
  $rhn_channels      = hiera('common::os::rhnreg::rhn-channel',{})
  create_resources('Common::Os::Rhnreg::Rhn-channel', $rhn_channels)

  ###############
  # Networking
  $slaveinterfaces    = hiera('common::bonding::slaveinterface',{})
  $masterinterfaces   = hiera('common::bonding::masterinterface',{})
  $disabledinterface  = hiera('common::bonding::disabledinterface',{})
  $disable_tso        = hiera('dcache::defines::disable_tso',{})
        $bnx2x_ring_tunning = hiera('dcache::defines::bnx2x_ring_tunning',{})
        $bnx2x_flow_tunning = hiera('dcache::defines::bnx2x_flow_tunning',{})
        $speed_duplex       = hiera('dcache::defines::speed_duplex',{})

  create_resources('Common::Bonding::Slaveinterface',     $slaveinterfaces)
  create_resources('Common::Bonding::Masterinterface',    $masterinterfaces)
  create_resources('Common::Bonding::Disabledinterface',  $disabledinterface)
  create_resources('Dcache::Defines::Disable_tso',        $disable_tso)        # Affects Thumpers
  create_resources('Dcache::Defines::Bnx2x_ring_tunning', $bnx2x_ring_tunning) # Affects DDN
  create_resources('Dcache::Defines::Bnx2x_flow_tunning', $bnx2x_flow_tunning) # Affects DDN
  create_resources('Dcache::Defines::Speed_duplex',       $speed_duplex)       # Affects DDN

  ###############
  # Repositories
  $yumrepos = hiera_hash('yumrepos', {})
        create_resources('yumrepo', $yumrepos)

  $node_yumrepos = hiera_hash('node_yumrepos', {})
        create_resources('yumrepo', $node_yumrepos)

  ###############
  # Packages
  $node_packages = hiera_hash('node_packages', {})
  create_resources('package', $node_packages)

  # Only install dcache_packages when installable=true
  if ( hiera('installable') == true) {
    $dcache_packages = hiera_hash('dcache_packages', {})
    create_resources('package', $dcache_packages)
  }

  $other_packages = hiera_hash('other_packages', {})
  create_resources('package', $other_packages)

  ###############
  # Files
  $node_files = hiera_hash('node_files', {})
  create_resources('file', $node_files)

  # The following create_resources are files containing 'content: template("")'
  # template("") can't be managed by hiera, which considers a string instead of a function
  $node_template_files = hiera('node_template_files', {})
  create_resources(Dcache::Defines::Template_File, $node_template_files)

  ###############
  # dcpool Mount
  $dcpool_mount = hiera('dcache::mounts::dcpool::defines::mount',{})
  create_resources('Dcache::Mounts::Dcpool::Defines::Mount',$dcpool_mount)

  $dcpool_mountxfs = hiera('dcache::mounts::dcpool::defines::mountxfs',{})
  create_resources('Dcache::Mounts::Dcpool::Defines::Mountxfs',$dcpool_mountxfs)

  ###############
  # Exec 
  $node_execs = hiera_hash('node_execs', {})
  create_resources('exec', $node_execs)

  ###############
  # Cron 
  $node_crons = hiera_hash('node_crons', {})
  create_resources('cron', $node_crons)

  ###############
  # Services
        $node_services = hiera_hash('node_services', {})
        create_resources('service', $node_services)

  $services = hiera_hash('services', {})
  create_resources('service', $services)

  ###############
  # PostgreSQL
  if ( hiera('haspsqldb') == true ) {
    class { 'postgres':
        pgsqlv      => hiera('psqlversion'),
        installable => hiera('installable'),
        node_type   => hiera('nodetype'),
        instance    => hiera('instance'),
        backup      => hiera('psqlbackup'),
        ensure      => hiera('psqlensure'),
        enable      => hiera('psqlenable');
    }
  }

  ###############
  # Classes
  if ( hiera('hostcert') == true ) {
    class { 'certificates':
      owner => $dcacheuser,
      group => $dcachegroup;
    }
  }

  hiera_include('node_classes', {})
  ## END: YAML
  ####################################################

  ####################################################
  ## BEGIN: CLASSES
  case $nodetype {
    'pool': {
      class {
        'dcache::enstore::installation':;
        'dcache::enstore::configuration': require => Class['dcache::enstore::installation'];
      }
    }
  }

  ####################################################
  ## INIT: dCache JAVA Monitoring
  cron { 'dCacheJavaMonitoring':
    ensure  => present,
    command  => '/opt/mon_java.pl > /dev/null 2>&1',
    user  => 'root',
    minute  => [0,5,10,15,20,25,30,35,40,45,50,55];
  }

  file {'/opt/mon_java.pl':
    source  => 'puppet:///modules/dcache/common/opt/mon_java.pl',
    mode  => '0755',
    owner   => 'root',
    group   => 'root';
  }
  ## END: dCache JAVA Monitoring
  ####################################################

  ####################################################
  ####################################################
  ##  OLD SETTINGS KEPT IN CASE OF FUTURE PROBLEMS  ##
  ####################################################
  ####################################################

  ####################################################
        # Temporary patches for RH6.2:
        #   https://access.redhat.com/support/cases/00605732 
        #    |- Plenty of "page allocation failure. 
  #       order:2, mode:0x20" in dmesg
  #   In the RH case they suggest to set it up to 2GB
        ## sysctl::value { "vm.min_free_kbytes": value => "1048576"}
}
