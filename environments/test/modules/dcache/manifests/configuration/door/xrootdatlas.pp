# Here we customize MAGIC's WebDav door
#
# As of 23/2/2012 this is just ordering by name/size/date the webpage output (https://dcgftp12.pic.es:443)

class dcache::configuration::door::xrootdatlas (
        $instance=$dcache::configuration::base::instance,
        $dcache_lshare_dir=$dcache::configuration::base::dcache_lshare_dir,
  $dcache_bin_dir=$dcache::configuration::base::dcache_bin_dir,
  $dcacheuser=$dcache::configuration::base::dcacheuser,
  $dcachegroup=$dcache::configuration::base::dcacheuser ) {


  ####################################################
  ## RESOURCE GLOBAL DEFINITION
  ####################################################
  File {
    ensure  => present,
    owner   => $dcacheuser,
    group   => $dcachegroup,
    mode    => '0644',
  }

  Package {
    require => Yumrepo['wlcg-x86_64.repo'],
  }

        common::defines::line {
    'dcachelocalsh_lfchost':
                  file   => "${dcache_bin_dir}/dcache.local.sh",
                  line   => 'export LFC_HOST=prod-lfc-atlas-ro.cern.ch',
                  ensure => present;
    'dcachelocalsh_srmhost':
                  file   => "${dcache_bin_dir}/dcache.local.sh",
                  line   => 'export SRM_HOST=srmatlas.pic.es',
                  ensure => present;
    'dcachelocalsh_csecmech':
                  file   => "${dcache_bin_dir}/dcache.local.sh",
                  line   => 'export CSEC_MECH=ID',
                  ensure => present;
    'dcachelocalsh_lfcconretry':
                  file   => "${dcache_bin_dir}/dcache.local.sh",
                  line   => 'export LFC_CONRETRY=0',
                  ensure => present;
        }

  file {
    [$dcache_lshare_dir,"${dcache_lshare_dir}/plugins"]: ensure => directory, mode => '0755';
  }

  ####################################################
  ### RESOURCE DEFINITION
  ####################################################

  yumrepo { 'wlcg-x86_64.repo':
    baseurl      => "http://linuxsoft.cern.ch/wlcg/sl${lsbmajdistrelease}/${architecture}/",
    descr        => 'WLCG Repository for XRootD Plugins',
    name         => 'wlcg-x86_64',
    enabled      => 1,
    gpgcheck     => 0;
  }


  file { "${dcache_lshare_dir}/plugins/xrootd4j-backport-2.4-SNAPSHOT": ensure => absent, force => true; }

  file {
    '/etc/grid-security/xrd':             ensure  => directory;
    '/etc/grid-security/xrd/xrdcert.pem': ensure  => symlink,
 target  => '/etc/grid-security/hostcert.pem', require => File['/etc/grid-security/xrd'];
    '/etc/grid-security/xrd/xrdkey.pem':  ensure  => symlink,
  target  => '/etc/grid-security/hostkey.pem',  require => File['/etc/grid-security/xrd'];
    '/etc/sysconfig/xrootd':        content => template('dcache/etc/sysconfig/xrootd.erb');
    '/etc/xrootd':                        ensure  => directory;
    '/etc/xrootd/auth_file':              source  => 'puppet:///modules/dcache/common/etc/xrootd/auth_file', require => File['/etc/xrootd'];
  }
  
  package {
    'vomsxrd':  ensure => '0.2.0-1.el6';
    'lcg-util': ensure => 'installed';
  }

  package { 'dcache-xrootd-n2n-plugin': ensure => '6.0.4-0'; }

  file { '/pnfs': ensure => directory; }

        common::defines::pnfs_mount {
    'pnfs':
      mntdir   => '/pnfs',
      instance => "${instance}_nfs4",
      pnfsdest => '/pnfs',
      rw       => 'no',
      require  => File['/pnfs'];
  }
}
